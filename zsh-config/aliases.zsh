# Update Packages
if command -v brew &>/dev/null; then
    alias search="brew search"
    alias install="brew install"
    alias update="brew update && brew upgrade && brew cleanup --prune=all && brew autoremove"
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
    alias npmui="npm uninstall"
fi

if command -v pip &>/dev/null; then
    alias pipimp="pip install ipykernel matplotlib numpy pandas scikit-learn scipy seaborn torch torchvision torchaudio virtualenv && pip install --upgrade certifi"
    alias pips="pip search"
    alias pipi="pip install"
    alias pipup="pip list --format=freeze | cut -d = -f 1 | xargs pip install --upgrade"
    alias pipui="pip uninstall"
    alias piprm="pip freeze | cut -d "@" -f1 | xargs pip uninstall -y"
    alias pipv="python -m venv env"
    alias pipa="source env/bin/activate"
    alias piprq="pip freeze > requirements.txt"
fi

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
    alias gi="git init"
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit -m"
    alias gpull="git pull --rebase origin"
    alias gpush="git push -u origin"
    alias gclone="git clone"
    alias gr="git remote add origin"
fi

if command -v timer &>/dev/null && command -v terminal-notifier &>/dev/null; then
    alias work="timer 60m && terminal-notifier -message 'Pomodoro' -title 'Work Timer is up! Take a Break 😊' -sound Crystal"
    alias rest="timer 10m && terminal-notifier -message 'Pomodoro' -title 'Break is over! Get back to work 😬' -sound Crystal"
fi
