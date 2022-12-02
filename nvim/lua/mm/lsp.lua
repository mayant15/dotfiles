local capabilities = require'cmp_nvim_lsp'.default_capabilities()
local lspconfig = require'lspconfig'
local cmp = require'cmp'

-- See https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#super-tab-like-mapping
function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function handle_tab_press(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif has_words_before() then
        cmp.complete()
    else
        fallback()
    end
end

function handle_shift_tab_press(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

function handle_ctrl_space_press(fallback)
    if not cmp.visible() then
        cmp.complete()
    else
        fallback()
    end
end

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping(handle_tab_press, {"i", "s"}),
        ['<S-Tab>'] = cmp.mapping(handle_shift_tab_press, {"i", "s"}),
        -- TODO: Get this to work? C-Space should open up the menu
        -- ['<C-Space>'] = cmp.mapping(handle_ctrl_space_press, {"i", "s"})
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
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

-- Rust setup
lspconfig.rust_analyzer.setup {}

-- TypeScript
lspconfig.tsserver.setup {}

-- C++ setup
lspconfig.clangd.setup {
    capabilities = capabilities
}

-- Haskell setup
-- lspconfig.hls.setup {}

-- Zig set
-- lspconfig.zls.setup {}

-- Autocomplete
vim.o.completeopt = 'menu,menuone,preview,noinsert'

