selected=$(cat ~/dotfiles/tmux/.tmux-cht-command ~/dotfiles/tmux/.tmux-cht-languages | fzf)
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "^$selected$" ~/dotfiles/tmux/.tmux-cht-languages; then
    query=$(echo $query | tr ' ' '+')
    tmux neww bash -c "echo \"curl https://www.cht.sh/$selected/$query\"; curl https://www.cht.sh/$selected/$query; while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s https://www.cht.sh/$selected~$query | less"
fi
