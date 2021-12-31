# dotfiles

This is my zsh and vim configuration.

## Usage
Get all submodules with
```bash
git clone --recursive https://github.com/mayant15/dotfiles
```
Then run the provided install script
```bash
cd dotfiles
source install.sh
```
This would create symlinks in your home directory to zsh and vim config files in this repo.

## Dependencies for Zsh
You must have Zsh installed. I'm using [prezto](https://github.com/sorin-ionescu/prezto) for zsh configuration, which is provided as a submodule.

## Dependencies for Vim

1. Install [Vundle](https://github.com/VundleVim/Vundle.vim)
1. After running the install script open Vim with `vim ~/.vimrc`
1. Install plugins `:PluginInstall` and close Vim `:wqa`
1. Install [Exuberant Ctags](https://sourceforge.net/projects/ctags/) for tags to work
1. Install its prerequisites and compile [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe#installation) for
   code completion to work
1. Follow [these instructions](https://github.com/joshdick/onedark.vim#lightlinevim-colorscheme) to install the OneDark
   theme for lightline
1. Restart Vim `vim ~/.vimrc` and Ycm server `:YcmRestartServer`

## Neovim
I use when I'm working on Windows so this includes an `init.vim` as well. It requires [vim-plug](https://github.com/junegunn/vim-plug/) and [clangd](https://clangd.llvm.org/) to be installed. Start `nvim` with this `init.vim` and then run `:PlugInstall`.

