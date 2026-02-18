#!/usr/bin/env zsh

set -e
log() { echo "$(date "+%Y-%m-%d %H:%M:%S") - $1"; }

# DOTFILES_DIR path setup - define once, use everywhere
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

log "Starting dotfiles setup..."

# Apple Settings - group related settings together
setup_macos_preferences() {
    log "Configuring macOS preferences..."
    # Dock settings (combined into one command)
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 1000
    killall Dock &>/dev/null || true

    # Keyboard settings
    defaults write -g InitialKeyRepeat -int 10
    defaults write -g KeyRepeat -int 4
    defaults write -g ApplePressAndHoldEnabled -bool false

    # Suppress login welcome message
    touch ~/.hushlogin
}

# Install X-Code cli tools
install_xcode_tools() {
    if [[ "$(uname)" == "Darwin" ]]; then
        log "macOS detected"
        if xcode-select -p &>/dev/null; then
            log "Xcode command-line tools already installed"
        else
            log "Installing Xcode command-line tools..."
            xcode-select --install
            log "Please complete the Xcode installation prompt and run this script again"
            exit 0
        fi
    else
        log "Not macOS, skipping Xcode tools installation"
    fi
}

# Installing Brew - with checks and error handling
install_homebrew() {
    if command -v brew &>/dev/null; then
        log "Homebrew already installed"
    else
        log "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
            log "Error: Homebrew installation failed"
            exit 1
        }

        # Add Homebrew to PATH (if needed)
        if [[ "$(uname)" == "Darwin" ]]; then
            if [[ $(arch) == "arm64" ]]; then
                [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
            else
                [[ -f /usr/local/bin/brew ]] && eval "$(/usr/local/bin/brew shellenv)"
            fi
        fi
    fi

    log "Disabling Homebrew analytics..."
    brew analytics off

    log "Installing packages from Brewfile..."
    if [[ -f "$DOTFILES_DIR/brew/Brewfile" ]]; then
        brew bundle --file="$DOTFILES_DIR/brew/Brewfile" || log "Warning: Some Homebrew packages failed to install"
    else
        log "Error: Brewfile not found at $DOTFILES_DIR/brew/Brewfile"
    fi
}

# Improved symlink function
create_symlink() {
    local src=$1
    local dest=$2

    if [[ ! -e "$src" ]]; then
        log "Warning: Source does not exist: $src - skipping symlink"
        return 1
    fi

    local dest_dir="$(dirname "$dest")"
    if [[ ! -d "$dest_dir" ]]; then
        mkdir -p "$dest_dir" && log "Created directory: $dest_dir"
    fi

    if [[ -e "$dest" || -L "$dest" ]]; then
        if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
            log "Symlink already exists and points to correct target: $dest -> $src"
            return 0
        fi
        rm -rf "$dest" && log "Removed existing file or symlink: $dest"
    fi

    ln -s "$src" "$dest" && log "Created symlink: $dest -> $src"
}

setup_symlinks() {
    log "Setting up symlinks..."

    # ZSH configuration
    create_symlink "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
    create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

    # Development tools
    create_symlink "$DOTFILES_DIR/config/.clang-format" "$HOME/.clang-format"
    create_symlink "$DOTFILES_DIR/config/.clangd" "$HOME/.clangd"
    create_symlink "$DOTFILES_DIR/tmux/tmux-sessionizer.conf" "$CONFIG_DIR/tmux-sessionizer/tmux-sessionizer.conf"

    # Applications
    create_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
    create_symlink "$DOTFILES_DIR/ghostty" "$CONFIG_DIR/ghostty"
    create_symlink "$DOTFILES_DIR/aerospace/.aerospace.toml" "$HOME/.aerospace.toml"
    create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
    create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
}

update_path() {
    if [[ ":$PATH:" != *":$HOME/bin:/usr/local/bin:"* ]]; then
        export PATH="$HOME/bin:/usr/local/bin:$PATH"
        log "PATH updated to include $HOME/bin and /usr/local/bin"
    else
        log "PATH already contains required directories"
    fi
}

after() {
    if command -v fnm >/dev/null 2>&1; then
        sudo chown -R "$(whoami)" "$HOME/.local/share/fnm"
    fi
    if ! command -v uv >/dev/null 2>&1; then
        if command -v pip >/dev/null 2>&1; then
            echo "uv not found — installing via pip..."
            pip install --user uv
            export PATH="$HOME/.local/bin:$PATH"
        else
            echo "pip not found — cannot install uv"
        fi
    fi
}

main() {
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run with sudo."
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

main
