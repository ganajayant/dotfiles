addToPathFront() {
    [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

addToPathFront ~/dotfiles/scripts/

bindkey -s ^f "tmux-sessionizer\n"
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

autoload -U compinit && compinit -C
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt sharehistory
setopt hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
setopt completealiases

# Node Version Manager (FNM)
if command -v fnm &>/dev/null; then
    eval "$(fnm env --use-on-cd)"
    [[ -f .node-version || -f .nvmrc ]] && fnm use
fi

# Fuzzy Finder (FZF)
if command -v fzf &>/dev/null; then
    eval "$(fzf --zsh)"
fi

# Zsh Plugins
zsh_plugin_path="/opt/homebrew/share"

[[ -f "$zsh_plugin_path/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
    source "$zsh_plugin_path/zsh-autosuggestions/zsh-autosuggestions.zsh"

[[ -f "$zsh_plugin_path/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
    source "$zsh_plugin_path/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Homebrew Zsh Completions
if command -v brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
    autoload -Uz compinit && compinit -C
fi

# Custom Aliases, Functions & Exports
config_dir=~/dotfiles/zsh
if [[ -d "$config_dir" ]]; then
    for config_file in "$config_dir"/{aliases,exports,functions}.zsh; do
        [[ -f "$config_file" ]] && source "$config_file"
    done
fi

# Docker Completions
docker_completions=~/.docker/completions
[[ -d "$docker_completions" ]] && fpath=("$docker_completions" $fpath)
autoload -Uz compinit && compinit -C
