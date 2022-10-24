local map = vim.api.nvim_set_keymap
local noremap = { noremap = true }

-- No arrow keys :D
map('', '<Up>', '<Nop>', noremap)
map('', '<Down>', '<Nop>', noremap)
map('', '<Right>', '<Nop>', noremap)
map('', '<Left>', '<Nop>', noremap)

-- LSP shortcuts
map('n', '<leader>le', ':lua vim.diagnostic.open_float()<CR>', noremap)
map('n', '<leader>lh', ':lua vim.lsp.buf.hover()<CR>', noremap)
map('n', '<leader>ld', ':lua vim.lsp.buf.implementation()<CR>', noremap)
map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', noremap)
map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', noremap)
map('n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>', noremap)
map('n', '<C-]>', ':lua vim.lsp.buf.definition()<CR>', noremap)

-- Search with telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fp', builtin.registers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- File explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', noremap)

