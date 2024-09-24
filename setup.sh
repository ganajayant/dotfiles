#!/bin/zsh

create_symlink() {
    src=$1
    dest=$2
    if [ -L "$dest" ]; then
        echo "Symbolic link already exists: $dest"
    elif [ -e "$dest" ]; then
        echo "File already exists and is not a symbolic link: $dest"
    else
        ln -s "$src" "$dest" && echo "Created symlink: $dest -> $src"
    fi
}

create_symlink ~/dotfiles/.zshrc ~/.zshrc

create_symlink ~/dotfiles/additional-config/.clang-format ~/.clang-format

create_symlink ~/dotfiles/additional-config/.clangd ~/.clangd

create_symlink ~/dotfiles/nvim ~/.config/nvim

create_symlink ~/dotfiles/alacritty ~/.config/alacritty

export PATH=$HOME/bin:/usr/local/bin:$PATHcreate_symlink ~/dotfiles/additional-config/.tmux.conf ~/.tmux.conf
