# Functions
mkcd() {
    if (($# != 1)); then
        echo "Invalid number of parameters. Usage: mkcd <DIR_PATH>"
        return 1
    fi
    mkdir -p "$@" && cd "$@" || return 1
}

count() {
    ls -1 "$@" | wc -l
}

push() {
    if [ $# -eq 0 ]; then
        echo "Commit message is required."
        return 1
    fi
    find . -name '.DS_Store' -type f -delete
    git add . && git commit -m "$@" && git push origin
}

reload() {
    source ~/.zshrc
    echo "ZSH configuration reloaded."
}

fs() {
    if [[ -n "$@" ]]; then
        du -sh -- "$@"
    else
        du -sh ./*
    fi
}

clonecd() {
    if (($# != 1)); then
        echo "Invalid number of parameters. Usage: clonecd <REPO_URL>"
        return 1
    fi
    git clone "$@" && cd "$(basename "$@" .git)" && code .
}

up() {
    if (($# == 0)); then
        echo "Counter is required."
        return 1
    fi
    local counter=${1:-1}
    local dirup="../"
    local out=""
    while ((counter > 0)); do
        let counter--
        out="${out}$dirup"
    done
    cd $out || return 1
}

function expand-alias() {
    zle _expand_alias
    zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias
