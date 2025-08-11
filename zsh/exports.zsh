# Java Development Kit (JDK)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Go Language Setup
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# Enable colored output
export CLICOLOR=1

# GIT Editor
export GIT_EDITOR="nvim"

# Define a file/directory preview command for FZF
export show_file_or_dir_preview='if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'

# Set FZF options
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
