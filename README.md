# dotfiles

This is my zsh and neovim configuration.

## Usage

Clone with all submodules
```bash
git clone --recursive https://github.com/mayant15/dotfiles
```

You must have Zsh installed. I'm using [prezto](https://github.com/sorin-ionescu/prezto) for zsh configuration, which is provided as a submodule and can be installed with the provided `install.sh` script.

**NOTE:** This creates symlinks in your home directory to this repo's zsh config files

For Neovim you can just pick the provided `init.vim`. It requires [vim-plug](https://github.com/junegunn/vim-plug/) to be installed. Language servers can be added/removed as required, `clangd` is enabled by default.

### Windows

Some configuration for Windows is provided:
1. `profile.ps1`: PowerShell config with aliases and Starship integration.
1. `starship.toml`: [Starship](https://starship.rs) prompt config with a stripped down [Pastel Powerline](https://starship.rs/presets/pastel-powerline.html) preset. Requires a Nerd Font (like Caskaydia Cove Nerd Font).

Place symlinks to these files in the directory containing your PowerShell `$PROFILE`

