# Update Packages
alias search="brew search $1"
alias install="brew install $1"
alias update="brew update; sleep 2; brew upgrade; sleep 2; brew cleanup"
alias uninstall="brew uninstall $1"

alias npmsearch="npm search $1"
alias npminstall="npm install $1"
alias npmupdate="sudo npm upgrade -g"
alias npmuninstall="npm uninstall $1"

alias pipsearch="pip search $1"
alias pipinstall="pip install $1"
alias pipupdate="pip list --format=freeze | cut -d = -f 1 | xargs pip install --upgrade"
alias pipuninstall="pip uninstall $1"
alias pipimp="pip install ipykernel matplotlib numpy pandas scikit-learn scipy seaborn torch torchvision torchaudio virtualenv"
alias pipremove="pip freeze | xargs pip uninstall -y"
alias pipfreeze="pip freeze > requirements.txt"

# System
alias home="cd ~"
alias ..="cd .."
alias c="clear"
alias e="exit"
alias dockreset="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rmf="rm -rf"

# Git
alias gitinit="git init"
alias gitstatus="git status"
alias gitadd="git add $1"
alias gitcommit="git commit -m $1"
alias gitpull="git pull --rebase origin $1"
alias gitpush="git push -u origin $1"
alias gitclone="git clone $1"
alias gitremote="git remote add origin $1"

# Web
alias brave="open -a 'Brave Browser' --args"
alias incognito="open -a 'Brave Browser' -n --args --incognito"
alias goku="open -a 'Brave Browser' -n --args --incognito --new-window https://goku.sx/home/"
alias heymovies="open -a 'Brave Browser' -n --args --incognito --new-window https://heymovies.to/home"

# Common Directories
alias air='$(go env GOPATH)/bin/air'
