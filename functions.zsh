# Functions
mkcd() {
    if (($# != 1)); then
        echo "Invalid number of parameters. Usage: mkc <DIR_PATH>"
        return 1
    fi
    mkdir -p "$@" && cd "$_"
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
    git add .
    git commit -m "$@"
    git push origin
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
