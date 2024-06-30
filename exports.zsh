# JDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Go Lang
GOPATH=$HOME/go
PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# CLICOLOR
export CLICOLOR=1

# FuzzyFinder

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
