#!/bin/zsh

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Symlink config
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf

