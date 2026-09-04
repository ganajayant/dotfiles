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
export show_file_or_dir_preview='
  if [ -d "{}" ]; then
    ls -lha "{}" | head -200
  else
    cat -n --color=always --line-range :500 "{}"
  fi
'

# File finder
export FZF_CTRL_T_OPTS="
  --preview '$show_file_or_dir_preview'
  --preview-window='right:60%:border-left'
"

# General FZF
export FZF_DEFAULT_OPTS="
  --height=60%
  --layout=reverse
  --border=rounded
  --info=inline
  --prompt='❯ '
  --cycle
  --scroll-off=5
  --bind='ctrl-j:down'
  --bind='ctrl-k:up'
"
export XDG_RUNTIME_DIR="${TMPDIR:-/tmp}"
