" Neovim configuration

"""" vim-plug """"
call plug#begin(stdpath('data') . '/plugged')

" LSP and autocompletion
Plug 'neovim/nvim-lspconfig'
"
" Completion plugin
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

" Completion sources
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'

Plug 'onsails/lspkind-nvim'

" Language Support
" Plug 'simrat39/rust-tools.nvim'

" Information
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
" Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'

" Editing
Plug 'windwp/nvim-autopairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text properties
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

set textwidth=120

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rnu nu
set mouse=a

" No arrow keys :D
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Right> <Nop>
noremap <Left> <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hlsearch
set cul

if (has("termguicolors"))
    set termguicolors
endif

" OneDark config
let g:onedark_terminal_italics=1

" Nord config
let g:nord_italic = 1
let g:nord_underline = 1

" Ayu config
let ayucolor="mirage"

syntax on
colorscheme ayu

set laststatus=2
set noshowmode

" Keep some space in gutter for symbols
set signcolumn=yes

let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'active': {
            \ 'left' : [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']],
            \ 'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']],
            \ },
            \ 'component_function': {
                \ 'filename': 'LightlineFilename',
            \ },
            \ }

function! LightlineFilename()
    return expand('%:.')
endfunction

" Goyo config
let g:goyo_linenr=1
nnoremap <leader>df :Goyo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nerdtree
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos="right"

" fzf
nnoremap <C-p> :FZF<CR>

" Use ripgrep if available
if executable('rg')
    " Use rg for :grep
    set grepprg=rg

    " Use rg in fzf
    let $FZF_DEFAULT_COMMAND = 'rg --files -S'
endif

" Autocompletion
set completeopt=menu,menuone,preview

" LSP mappings
nnoremap <leader>le :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>lh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ld :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>la :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>lr :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>lf :lua vim.lsp.buf.formatting_sync()<CR>
nnoremap <C-]> :lua vim.lsp.buf.definition()<CR>

" vim-fugitive
" nnoremap <leader>gs :vert G<CR>:vertical res 30<CR>

lua <<EOF
  require("indent_blankline").setup {}

  -- require("rust-tools").setup {}
  require("nvim-autopairs").setup {}


  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    formatting = {
      format = lspkind.cmp_format(),
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-Space'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's', 'c'}),
--      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's', 'c'})
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- clangd setup
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }

  -- TypeScript setup
  --[[
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  --]]

EOF

