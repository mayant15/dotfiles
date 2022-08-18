#!/usr/bin/zsh

###############################################################################
# Prezto

ln -s $(pwd)/prezto "${ZDOTDIR:-$HOME}/.zprezto"

# From prezto docs
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

###############################################################################
# Neovim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy config
NVIM_CONFIG_DIR=$HOME/.config/nvim
mkdir -p $NVIM_CONFIG_DIR
ln -s $(pwd)/init.vim $NVIM_CONFIG_DIR/init.vim

###############################################################################
# Starship prompt

# Install starship
cargo install starship --locked

# Copy config
STARSHIP_CONFIG_DIR=$HOME/.config
mkdir -p $STARSHIP_CONFIG_DIR
ln -s $(pwd)/starship.toml $STARSHIP_CONFIG_DIR/starship.toml

