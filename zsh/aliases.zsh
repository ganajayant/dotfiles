# Update Packages
if command -v brew &>/dev/null; then
    alias search="brew search"
    alias install="brew install"
    alias update="brew update && brew upgrade"
    alias uninstall="brew uninstall"
    alias list="brew list"
    alias cleanup="brew cleanup --prune=all && brew autoremove"
fi

if command -v mas &>/dev/null; then
    alias installa="mas install"
    alias updatea="mas upgrade"
    alias searcha="mas search"
    alias uninstalla="mas uninstall"
fi

if command -v mas &>/dev/null && command -v brew &>/dev/null; then
    alias updateall="update && updatea"
fi

# NPM aliases
if command -v npm &>/dev/null; then
    alias npms="npm search"
    alias npmi="npm install"
    alias npmup="npm upgrade -g"
    alias npmui="npm uninstall"
    alias npmperm="sudo chown -R $(whoami) $HOME/.local/share/fnm"
    alias npmcache="npm cache clean --force"
fi

# Pip aliases
if command -v pip &>/dev/null; then
    alias pipimp="pip install ipykernel matplotlib nltk numpy pandas scikit-learn scipy seaborn spacy torch torchvision torchaudio virtualenv && pip install --upgrade certifi"
    alias pips="pip search"
    alias pipi="pip install"
    alias pipup="pip list --format=freeze | cut -d = -f 1 | xargs pip install --upgrade"
    alias pipui="pip uninstall"
    alias piprm="pip freeze | cut -d "@" -f1 | xargs pip uninstall -y"
    alias pipv="python -m venv env"
    alias pipa="source env/bin/activate"
    alias piprq="pip freeze > requirements.txt"
    alias pipcache="python -m pip cache purge"
fi

# tmux aliases
if command -v tmux &>/dev/null; then
    alias tmks="tmux kill-server"
    alias tml="tmux list-sessions"
fi

# VI Editor
if command -v nvim &>/dev/null; then
    alias vi="nvim"
    alias vim="nvim"
fi

if command -v eza &>/dev/null; then
    alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
fi

# System
alias xargs="xargs "
alias home="cd ~"
alias c="clear"
alias t="touch"
alias e="exit"
alias la="ls -A"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -Irv"
alias untar="tar -zxvf"
alias dockreset="sudo find 2>/dev/null /private/var/folders/ -type d -name com.apple.dock.launchpad -exec rm -rf {} +; killall Dock"

# Git
if command -v git &>/dev/null; then
    alias gi="git init"
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit -m"
    alias gpull="git pull --rebase origin"
    alias gpush="git push -u origin"
    alias gclone="git clone"
    alias gr="git remote add origin"
fi
