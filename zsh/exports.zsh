# Java Development Kit (JDK)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Go Language Setup
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"

# Enable colored output
export CLICOLOR=1

# GIT Editor
export GIT_EDITOR="nvim"

# FZF Preview
export show_file_or_dir_preview="if [ -d {} ]; then ls -lha {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview \"$show_file_or_dir_preview\""
export FZF_ALT_C_OPTS="--preview 'ls -lha {} | head -200'"
