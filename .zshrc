# JDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# CLICOLOR
export CLICOLOR=1

# Node Version Manager
if command -v fnm &>/dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

# ZSH Plugins
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Custom Aliases & Functions
if [ -f ~/dotfiles/aliases.zsh ]; then
    source ~/dotfiles/aliases.zsh
fi

if [ -f ~/dotfiles/functions.zsh ]; then
    source ~/dotfiles/functions.zsh
fi
