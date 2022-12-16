local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed {
    'tsserver',
    'clangd',
    'rust_analyzer',
    'sumneko_lua'
}

-----------------------------------------------------------
--  LSP key mappings
-----------------------------------------------------------

local cmp = require('cmp')

-- See https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#super-tab-like-mapping
function HasWordsBefore()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function HandleTabPress(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif HasWordsBefore() then
        cmp.complete()
    else
        fallback()
    end
end

function HandleShiftTabPress(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

function HandleCtrlSpacePress(fallback)
    if not cmp.visible() then
        cmp.complete()
    else
        fallback()
    end
end

local cmp_mappings = lsp.defaults.cmp_mappings {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping(HandleTabPress, {"i", "s"}),
    ['<S-Tab>'] = cmp.mapping(HandleShiftTabPress, {"i", "s"}),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-Space>'] = cmp.mapping(HandleCtrlSpacePress, {"i", "s"}),
}

lsp.setup_nvim_cmp {
    mapping = cmp_mappings
}

lsp.set_preferences {
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
}

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    local map = vim.keymap.set

    -- LSP diagnostics
    map('n', '<leader>le', vim.diagnostic.open_float, opts)
    map('n', '[d', vim.diagnostic.goto_prev, opts)
    map('n', ']d', vim.diagnostic.goto_next, opts)

    -- LSP code actions
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('i', '<C-k>', vim.lsp.buf.signature_help, opts)
    map('n', '<leader>la', vim.lsp.buf.code_action, opts)
    map('n', '<leader>lr', vim.lsp.buf.rename, opts)
    map('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
end)

lsp.setup()
