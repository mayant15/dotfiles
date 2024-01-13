#!/bin/zsh

ln -s $(pwd)/nvim $HOME/.config/nvim
ln -s $(pwd)/alacritty $HOME/.config/alacritty
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/tmux-sessionizer $HOME/.local/bin/tmux-sessionizer

ln -s $(pwd)/prezto "${ZDOTDIR:-$HOME}/.zprezto"

# From prezto docs
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

