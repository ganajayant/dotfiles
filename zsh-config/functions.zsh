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

generate_maven_project() {
    if ! command -v mvn &>/dev/null; then
        echo "Maven is not installed. Please install Maven before running this script."
        return 1
    fi

    if [[ $# -lt 1 || $# -gt 2 ]]; then
        echo "Usage: generate_maven_project [<groupId>] <artifactId>"
        return 1
    fi

    local groupId="com.example"
    local artifactId=$1

    if [[ $# -eq 2 ]]; then
        groupId=$1
        artifactId=$2
    else
        artifactId=$1
    fi

    mvn archetype:generate \
        -DgroupId=$groupId \
        -DartifactId=$artifactId \
        -DarchetypeCatalog=internal \
        -DinteractiveMode=false
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

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
    cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export | unset) fzf --preview "eval 'echo $'{}" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
    esac
}
