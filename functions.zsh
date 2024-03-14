# Functions
function mkcd() {
    mkdir -p "$@" && cd "$_"
}

function count() {
    ls1 "$@" | wc -l
}
