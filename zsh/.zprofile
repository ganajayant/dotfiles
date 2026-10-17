# Keep PATH free of duplicate entries
typeset -U path PATH

# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:$HOME/.docker/bin"
# End of Docker Desktop section.

# Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Visual Studio Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Python Configuration
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# Tex Configuration
export PATH="/Library/TeX/texbin:$PATH"
