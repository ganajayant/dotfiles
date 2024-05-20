autoload -Uz compinit && compinit

# List all items after pressing tab
set completion-ignore-case on
set show-all-if-ambiguous on

# Eza
if command -v eza &>/dev/null; then
    alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

fi

# Node Version Manager
if command -v fnm &>/dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

# FuzzyFinder
if command -v fzf &>/dev/null; then
    eval "$(fzf --zsh)"
fi

# ZSH Plugins
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Custom Aliases, Functions & Exports
if [ -f ~/dotfiles/aliases.zsh ]; then
    source ~/dotfiles/aliases.zsh
fi

if [ -f ~/dotfiles/exports.zsh ]; then
    source ~/dotfiles/exports.zsh
fi

if [ -f ~/dotfiles/functions.zsh ]; then
    source ~/dotfiles/functions.zsh
fi
