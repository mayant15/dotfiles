set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'joshdick/onedark.vim'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'dense-analysis/ale'
Plugin 'bling/vim-bufferline'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" Text settings
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

set textwidth=120

" Search
set hlsearch
if executable('rg')
    " Use rg over grep
"    set grepprg=rg\ --vimgrep\ --no-heading
"    set grepformat=%f:%l:%c:%m,%f,%l,%m

    let g:ackprg = 'rg --vimgrep --smart-case --no-heading'
    let g:ack_autoclose = 1
    cnoreabbrev Ack Ack!
    nnoremap <leader>/ :Ack!<space>
    nnoremap <silent> [q :cprevious<CR>
    nnoremap <silent> ]q :cnext<CR>
endif


" Code folding
" set foldmethod=syntax
" set foldlevel=99

" OneDark theme
if (has("termguicolors"))
    set termguicolors
endif

let g:onedark_terminal_italics=1

syntax on
colorscheme onedark

" Line numbers
set number relativenumber
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */

" Switch between header and source files with F4
" map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" NERDTree
let NERDTreeShowHidden=1

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" lightline
set laststatus=2
set noshowmode

let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'active': {
            \ 'left' : [['mode', 'paste'], ['readonly', 'filename', 'modified']],
            \ 'right': [['lineinfo'], ['percent'], ['breadcrumb', 'fileformat', 'fileencoding', 'filetype']],
            \ },
            \ 'component_function': {
                \ 'filename': 'LightlineFilename',
                \ 'breadcrumb': 'LightlineBreadcrumb'
            \ },
            \ }

function! LightlineFilename()
    return expand('%:.')
endfunction

function! LightlineBreadcrumb()
    return tagbar#currenttag('%s', '', 'f')
endfunction

" Don't use arrow keys you scum
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

" Ale
" let g:ale_sign_column_always=1
" let g:ale_linters = {'rust': ['analyzer']}

" YouCompleteMe
set completeopt=popup,preview,menuone

let g:ycm_language_server =
            \ [
            \   {
            \       'name': 'rust',
            \       'cmdline': ['rust-analyzer'],
            \       'filetypes': ['rust'],
            \       'project_root_files': ['Cargo.toml']
            \   }
            \ ]

nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gd :YcmCompleter GoTo<CR>

" Buffer movement
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
