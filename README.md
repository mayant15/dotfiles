# dotfiles

This is my zsh and neovim configuration.

## Usage

**Requirements:**
1. You must have [ZSH installed first](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
1. A Nerd Font for the prompt (like [Caskaydia Cove](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode))

Clone with all submodules
```bash
git clone --recursive https://github.com/mayant15/dotfiles
```

The configuration can be installed using the provided `install.sh` script.

**WARNING:** This creates symlinks in your home directory. Please backup your own config files and inspect the script before running.

The following components are installed:
1. [prezto](https://github.com/sorin-ionescu/prezto) for zsh configuration.
1. [Neovim](https://github.com/neovim/neovim/) config with plugins via [vim-plug](https://github.com/junegunn/vim-plug/). Language servers can be added/removed as required, `clangd` is enabled by default.
1. [Starship](https://starship.rs) prompt with a stripped down [Pastel Powerline](https://starship.rs/presets/pastel-powerline.html) preset.

### Windows

Some PowerShell configuration is also provided that I use on Windows. Place symlinks to `profile.ps1` and `starship.toml` in the directory containing your PowerShell `$PROFILE`.

