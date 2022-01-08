set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/lightline.vim'
"Plugin 'itchyny/vim-gitbranch'
"Plugin 'airblade/vim-gitgutter'
Plugin 'joshdick/onedark.vim'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'dense-analysis/ale'
Plugin 'bling/vim-bufferline'
Plugin 'preservim/nerdtree'
"Plugin 'preservim/tagbar'
"Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

set textwidth=120


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search
set hlsearch

" Use ripgrep if available
if executable('rg')
    " Use rg for :grep
    set grepprg=rg

    " Use rg in fzf
    let $FZF_DEFAULT_COMMAND = 'rg --files -S'    
endif

" Remap Ctrl+P to fzf
nnoremap <C-p> :FZF<CR>

"if executable('rg')
"    " Use rg over grep
"    let g:ackprg = 'rg --vimgrep --smart-case --no-heading'
"    let g:ack_autoclose = 1
"    cnoreabbrev Ack Ack!
"    nnoremap <leader>/ :Ack!<space>
"    nnoremap <silent> [q :cprevious<CR>
"    nnoremap <silent> ]q :cnext<CR>
"endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cursor shapes
" 2 -> Solid block
" 6 -> Solid vertical bar
let &t_EI = "\e[2 q"
let &t_SI = "\e[6 q"

" Highlight current line
set cul

" OneDark theme
if (has("termguicolors"))
    set termguicolors
endif

let g:onedark_terminal_italics=1

syntax on
colorscheme onedark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mobility 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Line numbers
set number relativenumber
set showmatch

" Buffer movement
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>

" Mouse scroll
set mouse=a


" Don't use arrow keys you scum
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Information 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos="right"

" Start NERDTree when Vim starts with a directory argument.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif

" Tagbar position
" let g:tagbar_position="topleft vertical"

" lightline
set laststatus=2
set noshowmode

let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'active': {
            \ 'left' : [['mode', 'paste'], ['gitinfo', 'readonly', 'filename', 'modified']],
            \ 'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']],
            \ },
            \ 'component_function': {
                \ 'filename': 'LightlineFilename',
                \ 'gitinfo': 'FugitiveStatusline'
            \ },
            \ }

function! LightlineFilename()
    return expand('%:.')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion and linting 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YouCompleteMe
set completeopt=popup,preview,menuone

nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gd :YcmCompleter GoTo<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>gs :vert G<CR>:vertical res 30<CR>

