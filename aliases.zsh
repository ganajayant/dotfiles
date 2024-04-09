# Update Packages
if command -v brew &>/dev/null; then
    alias search="brew search"
    alias install="brew install"
    alias update="brew update && brew upgrade && brew cleanup"
    alias uninstall="brew uninstall"
    alias list="brew list"
fi

if command -v mas &>/dev/null; then
    alias installa="mas install"
    alias updatea="mas upgrade"
    alias searcha="mas search"
    alias uninstalla="mas uninstall"
    alias updateall="update && updatea"
fi

if command -v npm &>/dev/null; then
    alias npms="npm search"
    alias npmi="npm install"
    alias npmup="sudo npm upgrade -g"
    alias npmun="npm uninstall"
fi

if command -v pip &>/dev/null; then
    alias pips="pip search"
    alias pipi="pip install"
    alias pipup="pip list --format=freeze | cut -d = -f 1 | xargs pip install --upgrade"
    alias pipun="pip uninstall"
    alias pipimp="pip install ipykernel matplotlib numpy pandas scikit-learn scipy seaborn torch torchvision torchaudio virtualenv"
    alias pipremove="pip freeze | xargs pip uninstall -y"
    alias pipvirtual="virtualenv venv"
    alias pipactivate="source venv/bin/activate"
    alias pipfreeze="pip freeze > requirements.txt"
fi

# System
alias home="cd ~"
alias c="clear"
alias t="touch"
alias e="exit"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias ls1="ls -1"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -Irv"
alias sizeof="ls -lh"
alias untar="tar -zxvf"

# Git
if command -v git &>/dev/null; then
    alias giti="git init"
    alias gits="git status"
    alias gita="git add"
    alias gitc="git commit -m"
    alias gitpull="git pull --rebase origin"
    alias gitpush="git push -u origin"
    alias gitcl="git clone"
    alias gitremote="git remote add origin"
fi

# Web
alias brave="open -a 'Brave Browser' --args"
alias incognito="open -a 'Brave Browser' -n --args --incognito"
alias goku="open -a 'Brave Browser' -n --args --incognito --new-window https://goku.sx/home/"
alias heymovies="open -a 'Brave Browser' -n --args --incognito --new-window https://heymovies.to/home"

# Common Directories
alias air='$(go env GOPATH)/bin/air'
