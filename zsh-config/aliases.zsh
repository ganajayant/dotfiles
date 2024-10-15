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
    alias npmui="npm uninstall"
fi

if command -v pip3 &>/dev/null; then
    alias pipimp="pip3 install ipykernel matplotlib numpy pandas scikit-learn scipy seaborn torch torchvision torchaudio virtualenv && pip3 install --upgrade certifi"
    alias pips="pip3 search"
    alias pipi="pip3 install"
    alias pipup="pip3 list --format=freeze | cut -d = -f 1 | xargs pip3 install --upgrade"
    alias pipui="pip3 uninstall"
    alias piprm="pip freeze | cut -d "@" -f1 | xargs pip uninstall -y"
    alias pipv="virtualenv venv"
    alias pipa="source venv/bin/activate"
    alias piprq="pip3 freeze > requirements.txt"
fi

if command -v nvim &>/dev/null; then
    alias vi="nvim"
    alias vim="nvim"
fi

if command -v eza &>/dev/null; then
    alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
fi

if command -v zoxide &>/dev/null; then
    alias cd="z"
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
    alias gi="git init"
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit -m"
    alias gpull="git pull --rebase origin"
    alias gpush="git push -u origin"
    alias gclone="git clone"
    alias gr="git remote add origin"
fi

# Web
alias brave="open -a 'Brave Browser' --args"
alias incognito="open -a 'Brave Browser' -n --args --incognito"
