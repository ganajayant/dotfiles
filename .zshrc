# JDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# CLICOLOR
export CLICOLOR=1

# Node Version Manager
eval "$(fnm env --use-on-cd)"

# ZSH Plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom Aliases & Functions
source ~/dotfiles/aliases.zsh
source ~/dotfiles/functions.zsh
