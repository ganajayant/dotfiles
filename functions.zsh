# Functions
function mkcd() {
    mkdir -p "$@" && cd "$_"
}

function count() {
    ls1 "$@" | wc -l
}

function push() {
    git add .
    git commit -m "$@"
    git push origin
}
