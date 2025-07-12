# Update Packages
if command -v brew &>/dev/null; then
    alias update="brew update && brew upgrade"
    alias cleanup="brew cleanup --prune=all && brew autoremove"
fi

if command -v mas &>/dev/null; then
    alias updatea="mas upgrade"
    alias uninstalla="mas uninstall"
fi

if command -v mas &>/dev/null && command -v brew &>/dev/null; then
    alias updateall="update && updatea"
fi

# NPM aliases
if command -v npm &>/dev/null; then
    alias npmup="npm upgrade -g"
    alias npmperm="sudo chown -R $(whoami) $HOME/.local/share/fnm"
    alias npmcache="npm cache clean --force"
fi

# Pip aliases
if command -v pip &>/dev/null; then
    alias pipimp="pip install ipykernel matplotlib nltk numpy pandas scikit-learn scipy seaborn spacy torch torchvision torchaudio virtualenv && pip install --upgrade certifi"
    alias pipup="pip list --format=freeze | cut -d = -f 1 | xargs pip install --upgrade"
    alias piprm="pip freeze | cut -d "@" -f1 | xargs pip uninstall -y"
    alias pipv="python -m venv env"
    alias pipa="source env/bin/activate"
    alias piprq="pip freeze > requirements.txt"
    alias pipcache="python -m pip cache purge"
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
alias la="ls -A"
alias mv="mv -v"
alias cp="cp -rv"
alias rm="rm -Irv"
alias untar="tar -zxvf"
alias dock="sudo find 2>/dev/null /private/var/folders/ -type d -name com.apple.dock.launchpad -exec rm -rf {} +; killall Dock"

# Git
if command -v git &>/dev/null; then
    alias ggraph="git log --oneline --graph --all"
fi
