# Functions
mkcd() {
    if [[ $# -ne 1 ]]; then
        echo "Invalid number of parameters. Usage: mkcd <DIR_PATH>"
        return 1
    fi
    mkdir -p "$1" && cd "$1" || return 1
}

count() {
    ls -1 "$@" 2>/dev/null | wc -l
}

# Generate a Maven project
generate_maven_project() {
    if ! command -v mvn &>/dev/null; then
        echo "Maven is not installed. Please install Maven before running this script."
        return 1
    fi

    if [[ $# -lt 1 || $# -gt 2 ]]; then
        echo "Usage: generate_maven_project [<groupId>] <artifactId>"
        return 1
    fi

    local groupId=${1:-"com.example"}
    local artifactId=${2:-$1}

    mvn archetype:generate \
        -DgroupId="$groupId" \
        -DartifactId="$artifactId" \
        -DarchetypeCatalog=internal \
        -DinteractiveMode=false
}

# Git push with automatic commit
push() {
    if [[ $# -eq 0 ]]; then
        echo "Commit message is required."
        return 1
    fi
    find . -name '.DS_Store' -type f -delete
    git add . && git commit -m "$*" && git push origin
}

# Reload Zsh configuration
reload() {
    source ~/.zshrc && source ~/.zprofile
    echo "ZSH configuration reloaded."
}

# File size summary
fs() {
    du -sh -- "${@:-./*}"
}

# Clone a Git repository and open in VS Code
clonecd() {
    if [[ $# -ne 1 ]]; then
        echo "Invalid number of parameters. Usage: clonecd <REPO_URL>"
        return 1
    fi
    git clone "$1" && cd "$(basename "$1" .git)" && code .
}

# Move up multiple directories
up() {
    if [[ $# -eq 0 || $1 -lt 1 ]]; then
        echo "Usage: up <N>"
        return 1
    fi
    local out=$(printf '../%.0s' $(seq 1 "$1"))
    cd "$out" || return 1
}

# Expand alias on space
expand-alias() {
    zle _expand_alias
    zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

# Custom FZF previews
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
