#!/bin/zsh

create_symlink() {
    local src=$1
    local dest=$2

    if [ -L "$dest" ]; then
        echo "Symbolic link already exists: $dest"
    elif [ -e "$dest" ]; then
        echo "File already exists and is not a symlink: $dest"
    else
        ln -s "$src" "$dest" && echo "Created symlink: $dest -> $src"
    fi
}

create_symlink "$HOME/dotfiles/.zprofile" "$HOME/.zprofile"
create_symlink "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
create_symlink "$HOME/dotfiles/additional-config/.clang-format" "$HOME/.clang-format"
create_symlink "$HOME/dotfiles/additional-config/.clangd" "$HOME/.clangd"
create_symlink "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
create_symlink "$HOME/dotfiles/ghostty" "$HOME/.config/ghostty"
create_symlink "$HOME/dotfiles/aerospace/.aerospace.toml" "$HOME/.aerospace.toml"
create_symlink "$HOME/dotfiles/additional-config/.tmux.conf" "$HOME/.tmux.conf"

export PATH="$HOME/bin:/usr/local/bin:$PATH"

echo "All symlinks checked/created, and PATH updated!"
