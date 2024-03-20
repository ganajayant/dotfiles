# Update Packages
alias search="brew search"
alias install="brew install"
alias update="brew update; sleep 2; brew upgrade; sleep 2; brew cleanup"
alias uninstall="brew uninstall "
alias list="brew list"

alias npmsearch="npm search "
alias npminstall="npm install "
alias npmupdate="sudo npm upgrade -g"
alias npmuninstall="npm uninstall "

alias pipsearch="pip search "
alias pipinstall="pip install "
alias pipupdate="pip list --format=freeze | cut -d = -f 1 | xargs pip install --upgrade"
alias pipuninstall="pip uninstall "
alias pipimp="pip install ipykernel matplotlib numpy pandas scikit-learn scipy seaborn torch torchvision torchaudio virtualenv"
alias pipremove="pip freeze | xargs pip uninstall -y"
alias pipfreeze="pip freeze > requirements.txt"

# System
alias home="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias e="exit"
alias dockreset="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias ls1="ls -1"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -Irv"
alias sizeof='ls -lh'
alias f="fuck"

# Git
alias giti="git init"
alias gits="git status"
alias gita="git add "
alias gitc="git commit -m "
alias gitpull="git pull --rebase origin "
alias gitpush="git push -u origin "
alias gitcl="git clone "
alias gitremote="git remote add origin "

# Web
alias brave="open -a 'Brave Browser' --args"
alias incognito="open -a 'Brave Browser' -n --args --incognito"
alias goku="open -a 'Brave Browser' -n --args --incognito --new-window https://goku.sx/home/"
alias heymovies="open -a 'Brave Browser' -n --args --incognito --new-window https://heymovies.to/home"

# Common Directories
alias air='$(go env GOPATH)/bin/air'
