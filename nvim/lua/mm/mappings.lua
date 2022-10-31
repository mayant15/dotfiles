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
map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', noremap)
map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', noremap)
map('n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>', noremap)

-- Search and LSP with telescope
local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
local keymap_set = vim.keymap.set
keymap_set('n', '<C-p>', builtin.find_files, {})
keymap_set('n', '<leader>fg', builtin.live_grep, {})
keymap_set('n', '<leader>fb', builtin.buffers, {})
keymap_set('n', '<leader>fp', builtin.registers, {})
keymap_set('n', 'gd', builtin.lsp_definitions, {})
keymap_set('n', '<C-]>', builtin.lsp_references, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- File explorer
function open_file_browser()
    extensions.file_browser.file_browser({
        path = "%:p:h"
    })
end
vim.keymap.set('n', '<leader>e', open_file_browser, noremap)

