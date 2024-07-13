#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find /home ~/data/ ~/code ~/code/dotfiles -mindepth 1 -maxdepth 2 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

kitten @ --to unix:/tmp/sockkitty launch --type=tab --tab-title="$selected_name" --cwd="$selected"
