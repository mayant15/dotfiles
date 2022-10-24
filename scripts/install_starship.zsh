#!/bin/zsh

set -e

# Install starship
cargo install starship --locked

# Copy config
STARSHIP_CONFIG_DIR=$HOME/.config
mkdir -p $STARSHIP_CONFIG_DIR
ln -s $(pwd)/starship.toml $STARSHIP_CONFIG_DIR/starship.toml

