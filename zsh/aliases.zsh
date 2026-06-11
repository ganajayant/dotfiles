# Update Packages
if ((${+commands[brew]})); then
    alias update="brew update && brew upgrade"
fi

if ((${+commands[brew]} && ${+commands[mas]})); then
    alias updateall="update && mas upgrade"
fi

# System Maintenance
if ((${+commands[mo]})); then
    alias cleanup="mo clean"
fi

# NPM aliases
if ((${+commands[npm]})); then
    alias npm='echo "Use pnpm instead"'
    alias npx='echo "Use pnpm dlx instead"'
fi

# Python
alias python3=/usr/bin/python3
alias python=/usr/bin/python3
alias pip='/usr/bin/pip3'
alias pip3='/usr/bin/pip3'

# Pip aliases
if ((${+commands[pip]})); then
    alias pipup="pip list --format=freeze | cut -d = -f 1 | xargs pip install --upgrade"
    alias pipv="python -m venv env"
    alias pipa="source env/bin/activate"
    alias piprq="pip freeze > requirements.txt"
fi

if ((${+commands[uv]})); then
    alias uvup="uv pip list --format=freeze | cut -d = -f 1 | xargs uv pip install --upgrade"
    alias uvv="uv venv"
    alias uva="source .venv/bin/activate"
    alias uvrq="uv pip freeze > requirements.txt"
fi

# VI Editor
if ((${+commands[nvim]})); then
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
if ((${+commands[git]})); then
    alias ggraph="git log --oneline --graph --all"
fi
