#!/usr/bin/env zsh

set -e
log() { echo "$(date "+%Y-%m-%d %H:%M:%S") - $1"; }

# DOTFILES_DIR path setup - define once, use everywhere
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Capture the real user (the one who invoked sudo)
REAL_USER="${SUDO_USER:-$(whoami)}"
REAL_HOME=$(eval echo "~$REAL_USER")
DOTFILES_DIR="$REAL_HOME/dotfiles"
CONFIG_DIR="$REAL_HOME/.config"

# Run a command as the real (non-root) user
as_user() {
    if [[ "$EUID" -eq 0 ]]; then
        sudo -u "$REAL_USER" env HOME="$REAL_HOME" "$@"
    else
        "$@"
    fi
}

log "Starting dotfiles setup (real user: $REAL_USER)..."

setup_macos_preferences() {
    log "Configuring macOS preferences..."
    as_user defaults write com.apple.dock autohide -bool true
    as_user defaults write com.apple.dock autohide-delay -float 1000
    killall Dock &>/dev/null || true

    as_user defaults write -g InitialKeyRepeat -int 10
    as_user defaults write -g KeyRepeat -int 4
    as_user defaults write -g ApplePressAndHoldEnabled -bool false

    touch "$REAL_HOME/.hushlogin"

    # Create Screenshots folder and point macOS to it
    as_user mkdir -p "$REAL_HOME/Screenshots"
    as_user defaults write com.apple.screencapture location "$REAL_HOME/Screenshots"
    log "Screenshots folder created and screencapture location set"
}

install_xcode_tools() {
    if [[ "$(uname)" == "Darwin" ]]; then
        log "macOS detected"
        if xcode-select -p &>/dev/null; then
            log "Xcode command-line tools already installed"
        else
            log "Installing Xcode command-line tools..."
            as_user xcode-select --install
            log "Please complete the Xcode installation prompt and run this script again"
            exit 0
        fi
    else
        log "Not macOS, skipping Xcode tools installation"
    fi
}

install_homebrew() {
    # Homebrew refuses to run as root — always run it as the real user
    if as_user command -v brew &>/dev/null; then
        log "Homebrew already installed"
    else
        log "Installing Homebrew as $REAL_USER..."
        as_user /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
            log "Error: Homebrew installation failed"
            exit 1
        }
    fi

    # Ensure brew is on PATH for subsequent commands
    if [[ "$(uname)" == "Darwin" ]]; then
        if [[ "$(as_user uname -m)" == "arm64" ]]; then
            [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            [[ -f /usr/local/bin/brew ]] && eval "$(/usr/local/bin/brew shellenv)"
        fi
    fi

    log "Disabling Homebrew analytics..."
    as_user brew analytics off

    log "Installing packages from Brewfile..."
    if [[ -f "$DOTFILES_DIR/brew/Brewfile" ]]; then
        as_user brew bundle --file="$DOTFILES_DIR/brew/Brewfile" ||
            log "Warning: Some Homebrew packages failed to install"
    else
        log "Error: Brewfile not found at $DOTFILES_DIR/brew/Brewfile"
    fi
}

create_symlink() {
    local src=$1
    local dest=$2

    if [[ ! -e "$src" ]]; then
        log "Warning: Source does not exist: $src - skipping symlink"
        return 1
    fi

    local dest_dir
    dest_dir="$(dirname "$dest")"
    if [[ ! -d "$dest_dir" ]]; then
        as_user mkdir -p "$dest_dir" && log "Created directory: $dest_dir"
    fi

    if [[ -e "$dest" || -L "$dest" ]]; then
        if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
            log "Symlink already correct: $dest -> $src"
            return 0
        fi
        rm -rf "$dest" && log "Removed existing: $dest"
    fi

    as_user ln -s "$src" "$dest" && log "Created symlink: $dest -> $src"
}

setup_symlinks() {
    log "Setting up symlinks..."

    create_symlink "$DOTFILES_DIR/zsh/.zprofile" "$REAL_HOME/.zprofile"
    create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$REAL_HOME/.zshrc"

    create_symlink "$DOTFILES_DIR/config/.clang-format" "$REAL_HOME/.clang-format"
    create_symlink "$DOTFILES_DIR/config/.clangd" "$REAL_HOME/.clangd"
    create_symlink "$DOTFILES_DIR/tmux/tmux-sessionizer.conf" "$CONFIG_DIR/tmux-sessionizer/tmux-sessionizer.conf"

    create_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
    create_symlink "$DOTFILES_DIR/ghostty" "$CONFIG_DIR/ghostty"
    create_symlink "$DOTFILES_DIR/linearmouse" "$CONFIG_DIR/linearmouse"
    create_symlink "$DOTFILES_DIR/aerospace/.aerospace.toml" "$REAL_HOME/.aerospace.toml"
    create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$REAL_HOME/.tmux.conf"
    create_symlink "$DOTFILES_DIR/.gitconfig" "$REAL_HOME/.gitconfig"
}

update_path() {
    if [[ ":$PATH:" != *":$REAL_HOME/bin:/usr/local/bin:"* ]]; then
        export PATH="$REAL_HOME/bin:/usr/local/bin:$PATH"
        log "PATH updated to include $REAL_HOME/bin and /usr/local/bin"
    else
        log "PATH already contains required directories"
    fi
}

after() {
    if as_user command -v fnm >/dev/null 2>&1; then
        chown -R "$REAL_USER" "$REAL_HOME/.local/share/fnm"
    fi

    if ! as_user command -v uv >/dev/null 2>&1; then
        if as_user command -v pip >/dev/null 2>&1; then
            log "uv not found — installing via pip..."
            as_user pip install --user uv
            export PATH="$REAL_HOME/.local/bin:$PATH"
        else
            log "pip not found — cannot install uv"
        fi
    fi
}

main() {
    if [[ $EUID -ne 0 ]]; then
        log "Re-running with sudo..."
        exec sudo zsh "$0" "$@"
    fi

    if [[ -z "$SUDO_USER" || "$SUDO_USER" == "root" ]]; then
        log "Error: run this script as a normal user via sudo, not as root directly."
        log "Usage: sudo zsh setup.sh"
        exit 1
    fi

    setup_macos_preferences
    install_xcode_tools
    install_homebrew
    setup_symlinks
    update_path
    after
    log "Setup completed successfully!"
}

main "$@"
