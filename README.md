# dotfiles

This is my zsh, neovim and tmux configuration.

## Usage

**Requirements:**
1. Install [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH), [neovim](https://neovim.io/) and [tmux](https://github.com/tmux/tmux#welcome-to-tmux)
1. A Nerd Font for the prompt (like [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip))
1. [tmux-sessionizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer) script
   placed at `~/.local/bin/tmux-sessionizer` (can edit the path in `.tmux.conf`)

Clone with all submodules
```bash
git clone --recursive https://github.com/mayant15/dotfiles
```

The configuration can be installed using the provided `install.zsh` script.

**WARNING:** This creates symlinks in your home directory. Please backup your own config files and inspect the script before running.

The following components are installed:
1. [prezto](https://github.com/sorin-ionescu/prezto) for zsh configuration.
1. Neovim config with plugins via [lazy.nvim](https://github.com/folke/lazy.nvim). Language servers have been configured via [LspZero](https://github.com/VonHeikemen/lsp-zero.nvim).
1. Basic tmux keymaps and config

