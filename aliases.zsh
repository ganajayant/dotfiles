# Update Packages
if command -v brew &>/dev/null; then
    alias search="brew search"
    alias install="brew install"
    alias update="brew update && brew upgrade && brew cleanup"
    alias uninstall="brew uninstall"
    alias list="brew list"
fi

if command -v npm &>/dev/null; then
    alias npmsearch="npm search"
    alias npminstall="npm install"
    alias npmupdate="sudo npm upgrade -g"
    alias npmuninstall="npm uninstall"
fi

if command -v pip &>/dev/null; then
    alias pipsearch="pip search"
    alias pipinstall="pip install"
    alias pipupdate="pip list --format=freeze | cut -d = -f 1 | xargs pip install --upgrade"
    alias pipuninstall="pip uninstall"
    alias pipimp="pip install ipykernel matplotlib numpy pandas scikit-learn scipy seaborn torch torchvision torchaudio virtualenv"
    alias pipremove="pip freeze | xargs pip uninstall -y"
    alias pipvirtual="virtualenv venv"
    alias pipactivate="source venv/bin/activate"
    alias pipfreeze="pip freeze > requirements.txt"
fi

# System
alias home="cd ~"
alias ..="cd .."
alias ...="cd ../.."
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
