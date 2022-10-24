local capabilities = require'cmp_nvim_lsp'
local lspconfig = require'lspconfig'
local cmp = require'cmp'

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
    sources = cmp.config.sources(
    {{ name = 'path' }},
    {{ name = 'cmdline' }}
    )
})

-- Haskell setup
lspconfig.hls.setup {}

-- Rust setup
lspconfig.rust_analyzer.setup {}

-- C++ setup
lspconfig.clangd.setup {
    capabilities = capabilities
}

-- Autocomplete
-- vim.o.completeopt = 'menu,menuone,preview'

