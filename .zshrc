addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPathFront ~/dotfiles/scripts
bindkey -s ^f "tmux-sessionizer\n"

autoload -Uz compinit && compinit
set completion-ignore-case on
set show-all-if-ambiguous on

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Eza
if command -v eza &>/dev/null; then
    alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
fi

# Node Version Manager
if command -v fnm &>/dev/null; then
    eval "$(fnm env --use-on-cd)"
    if [[ -f .node-version || -f .nvmrc ]]; then
        fnm use
    fi
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

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# Custom Aliases, Functions & Exports
for config_file in ~/dotfiles/zsh-config/{aliases,exports,functions}.zsh; do
    [ -f "$config_file" ] && source "$config_file"
done
