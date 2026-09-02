#!/usr/bin/env zsh

addToPathFront() {
    [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

addToPathFront ~/dotfiles/tmux/
addToPathFront ~/dotfiles/tmux/tmux-sessionizer/

bindkey -s ^f "tmux-sessionizer\n"
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt sharehistory
setopt hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
setopt completealiases

# Node Version Manager (FNM)
if (( ${+commands[fnm]} )); then
    eval "$(fnm env --use-on-cd)"
    [[ -f .node-version || -f .nvmrc ]] && fnm use
fi

# Fuzzy Finder (FZF)
if (( ${+commands[fzf]} )); then
    eval "$(fzf --zsh)"
fi

# Zsh Plugins
zsh_plugin_path="/opt/homebrew/share"

[[ -f "$zsh_plugin_path/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
    source "$zsh_plugin_path/zsh-autosuggestions/zsh-autosuggestions.zsh"

[[ -f "$zsh_plugin_path/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
    source "$zsh_plugin_path/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Homebrew Zsh Completions
if (( ${+commands[brew]} )); then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
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

# Git Branch
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}
setopt PROMPT_SUBST
export PROMPT='%n@%m %1~ %F{green}$(parse_git_branch)%f $ '

# pnpm
export PNPM_HOME="/Users/ganajayantsigadam/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
