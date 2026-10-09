# Dotfiles

My personal macOS development environment: Zsh, Neovim, tmux, AeroSpace, Ghostty and a Homebrew `Brewfile`, wired up by a single `setup.sh`.

The repo is a plain dotfiles repository (no stow/chezmoi) — `setup.sh` symlinks files from this repo into your home directory and installs the tooling.

## Directory layout

| Path | What it is |
| --- | --- |
| `zsh/` | Zsh config: `.zshrc`, `.zprofile`, plus `aliases.zsh`, `exports.zsh`, `functions.zsh` (sourced) |
| `nvim/` | Neovim config (Lazy.nvim) with LSP, Treesitter, fzf-lua, etc. |
| `tmux/` | tmux config and the `tmux-sessionizer` submodule |
| `aerospace/` | AeroSpace tiling window manager config |
| `ghostty/` | Ghostty terminal config |
| `brew/` | `Brewfile` — CLI tools, casks, VS Code extensions |
| `config/` | `.clang-format` and `.clangd` |
| `setup.sh` | Installer: macOS defaults, Homebrew, submodules, symlinks |
| `.gitconfig` | Git config (symlinked to `~/.gitconfig`) |

## Prerequisites

- macOS (the script configures macOS `defaults` and installs Homebrew)
- A normal (non-root) user account with `sudo` access
- Xcode Command Line Tools — the script triggers the install prompt if missing

## Installation

1. Clone the repository **with submodules**:

   ```sh
   git clone --recurse-submodules https://github.com/ganajayant/dotfiles.git
   ```

   Already cloned without them? Initialize the `tmux-sessionizer` submodule:

   ```sh
   git submodule update --init --recursive
   ```

   `setup.sh` also runs this step, but doing it up front avoids surprises.

2. Run the installer (it re-executes itself with `sudo`):

   ```sh
   chmod +x setup.sh && ./setup.sh
   ```

3. Restart your terminal or run `reload` to pick up the new config.

You can clone the repo anywhere — `setup.sh` resolves its own location, so it does not assume `~/dotfiles`.

## What `setup.sh` does

- Sets a few macOS preferences (Dock autohide, fast key repeat, screenshot location).
- Installs Xcode Command Line Tools if needed.
- Installs Homebrew, disables analytics, and runs `brew bundle` against `brew/Brewfile`.
- Initializes git submodules (`tmux-sessionizer`).
- Symlinks the config files below.
- Adds `~/bin` and `/usr/local/bin` to `PATH` and finishes tooling setup (fnm, uv).

### Symlinks created

| Repo path | Destination |
| --- | --- |
| `zsh/.zprofile` | `~/.zprofile` |
| `zsh/.zshrc` | `~/.zshrc` |
| `zsh/.p10k.zsh` | `~/.p10k.zsh` |
| `config/.clang-format` | `~/.clang-format` |
| `config/.clangd` | `~/.clangd` |
| `tmux/tmux-sessionizer.conf` | `~/.config/tmux-sessionizer/tmux-sessionizer.conf` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `nvim` | `~/.config/nvim` |
| `ghostty` | `~/.config/ghostty` |
| `aerospace/.aerospace.toml` | `~/.aerospace.toml` |
| `.gitconfig` | `~/.gitconfig` |

`zsh/aliases.zsh`, `zsh/exports.zsh` and `zsh/functions.zsh` are sourced by `.zshrc` and are not symlinked individually.

## License

[MIT](LICENSE).
