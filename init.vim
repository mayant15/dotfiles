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

" Information
Plug 'nvim-lualine/lualine.nvim'
Plug 'bling/vim-bufferline'

" Editing
Plug 'windwp/nvim-autopairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'

" Theme
Plug 'Luxed/ayu-vim'
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

set background=dark

" Ayu config
let g:ayucolor="mirage"
let g:ayu_extended_palette = 1
let g:ayu_italic_comment = 1

syntax on
colorscheme ayu

set laststatus=2
set noshowmode

" Goyo config
let g:goyo_linenr=1
nnoremap <leader>df :Goyo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
  require("lualine").setup {}

  require("nvim-autopairs").setup {}

  local cmp = require('cmp')

  cmp.setup({
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
  local capabilities = require('cmp_nvim_lsp')

  -- TypeScript setup
  --[[
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  --]]

EOF

