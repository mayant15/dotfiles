local map = vim.keymap.set
local opts = { noremap = true }

-- No arrow keys :D
map('', '<Up>', '<Nop>', opts)
map('', '<Down>', '<Nop>', opts)
map('', '<Right>', '<Nop>', opts)
map('', '<Left>', '<Nop>', opts)

map('n', '<leader>lf', vim.cmd.Neoformat)

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<C-p>', builtin.find_files, {})
map('n', '<leader>fg', function()
    builtin.grep_string({ search = vim.fn.input("Find > ") })
end)
map('n', '<C-]>', builtin.lsp_references, {})

-- File explorer
map('n', '<leader>e', ':Ex!<CR>', noremap)

-- Buffers
map('n', '[b', vim.cmd.bprevious)
map('n', ']b', vim.cmd.bnext)

map('n', '<leader>gs', vim.cmd.Git)

