# Update Packages
if (( ${+commands[brew]} )); then
    alias update="brew update && brew upgrade"
fi

if (( ${+commands[brew]} && ${+commands[mas]} )); then
    alias updateall="update && mas upgrade"
fi

# System Maintenance
if (( ${+commands[mo]} )); then
    alias cleanup="mo clean"
fi

# NPM aliases
if (( ${+commands[npm]} )); then
    alias npmup="npm upgrade -g"
    alias npmcache="npm cache clean --force"
fi

# Pip aliases
if (( ${+commands[pip]} )); then
    alias pipup="pip list --format=freeze | cut -d = -f 1 | xargs pip install --upgrade"
    alias pipv="python -m venv env"
    alias pipa="source env/bin/activate"
    alias piprq="pip freeze > requirements.txt"
    alias pipcache="python -m pip cache purge"
fi

if (( ${+commands[uv]} )); then
    alias uvup="uv pip list --format=freeze | cut -d = -f 1 | xargs uv pip install --upgrade"
    alias uvv="uv venv"
    alias uva="source .venv/bin/activate"
    alias uvrq="uv pip freeze > requirements.txt"
    alias uvcache="uv cache clean"
fi

# VI Editor
if (( ${+commands[nvim]} )); then
    alias vi="nvim"
    alias vim="nvim"
fi

alias ls="ls -CAp --color=auto"

# System
alias la="ls -A"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -Irv"
alias untar="tar -zxvf"

# Git
if (( ${+commands[git]} )); then
    alias ggraph="git log --oneline --graph --all"
fi
