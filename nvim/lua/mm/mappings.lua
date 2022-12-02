local map = vim.keymap.set
local opts = { noremap = true }

-- No arrow keys :D
map('', '<Up>', '<Nop>', opts)
map('', '<Down>', '<Nop>', opts)
map('', '<Right>', '<Nop>', opts)
map('', '<Left>', '<Nop>', opts)

-- LSP diagnostics
map('n', '<leader>le', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)

-- LSP code actions
map('n', 'gd', vim.lsp.buf.definition, opts)
map('n', 'gD', vim.lsp.buf.declaration, opts)
map('n', 'K', vim.lsp.buf.hover, opts)
map('n', 'gi', vim.lsp.buf.implementation, opts)
map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
map('n', '<leader>la', vim.lsp.buf.code_action, opts)
map('n', '<leader>lr', vim.lsp.buf.rename, opts)
map('n', '<leader>lf', function()
    vim.lsp.buf.format { async = true }
end, opts)

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<C-p>', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fp', builtin.registers, {})
map('n', '<C-]>', builtin.lsp_references, {})

-- File explorer
map('n', '<leader>e', ':Ex!<CR>', noremap)

