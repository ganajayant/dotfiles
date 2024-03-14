# Functions
function mkcd() {
    mkdir -p "$@" && cd "$_"
}

function count() {
    l1 "$@" | wc -l
}

function lt() {
    tree -h -L "$1"
}
