" Neovim configuration
" I use this on Windows because compiling the dependencies of my Vim config is
" a pain

"""" vim-plug """"
call plug#begin(stdpath('data') . '/plugged')

" LSP and autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Information
Plug 'itchyny/lightline.vim'
Plug 'akinsho/bufferline.nvim'

" Editing
Plug 'windwp/nvim-autopairs'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

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

let g:onedark_terminal_italics=1

syntax on
colorscheme onedark

set laststatus=2
set noshowmode

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autocompletion
set completeopt=menu,menuone,preview

lua <<EOF
    require("nvim-autopairs").setup {}

    require("bufferline").setup {
        options = {
            numbers = function(opts)
                return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
            end,
            buffer_close_icon = "x",
            diagnostics = "nvim_lsp"
        }
    }

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping(
        function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
                cmp.confirm()
            else
                fallback()
            end
        end,
        {"i", "s", "c"}
      )
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
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF

