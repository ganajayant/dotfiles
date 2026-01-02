# Functions
mkcd() {
    if [[ $# -ne 1 ]]; then
        echo "Invalid number of parameters. Usage: mkcd <DIR_PATH>"
        return 1
    fi
    mkdir -p "$1" && cd "$1" || return 1
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

# Reload Zsh configuration
reload() {
    source ~/.zshrc && source ~/.zprofile
    echo "ZSH configuration reloaded."
}

# Expand alias on space
expand-alias() {
    zle _expand_alias
    zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias
