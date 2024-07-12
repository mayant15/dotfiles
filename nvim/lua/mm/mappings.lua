local map = vim.keymap.set

-- No arrow keys :D
map('', '<Up>', '<Nop>', { noremap = true })
map('', '<Down>', '<Nop>', { noremap = true })
map('', '<Right>', '<Nop>', { noremap = true })
map('', '<Left>', '<Nop>', { noremap = true })

-- Space is leader
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Telescope
local builtin = require('telescope.builtin')
local withTheme = function(f)
    local theme = require('telescope.themes').get_dropdown({})
    return function()
        f(theme)
    end
end

-- From https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
map('n', '<leader>?', withTheme(builtin.oldfiles), { desc = '[?] Find recently opened files' })
map('n', '<leader>sb', withTheme(builtin.buffers), { desc = '[S]earch existing [B]uffers' })

map('n', '<leader><space>', withTheme(builtin.find_files), { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', withTheme(builtin.help_tags), { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', withTheme(builtin.grep_string), { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', withTheme(builtin.live_grep), { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', withTheme(builtin.diagnostics), { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>hh', withTheme(builtin.marks), { desc = 'Search Marks' })

map('n', '<C-j>', ':cnext<CR>', { desc = 'Go to next entry in the quickfix list' })
map('n', '<C-k>', ':cprev<CR>', { desc = 'Go to previous entry in the quickfix list' })

-- File explorer
map('n', '<leader>1', ':Ex<CR>', { noremap = true })

-- Buffers
map('n', '[b', vim.cmd.bprevious)
map('n', ']b', vim.cmd.bnext)

-- Camera locations
map('n', '<leader>4', "'A", { desc = 'Go to camera location 1' })
map('n', '<leader>5', "'B", { desc = 'Go to camera location 2' })
map('n', '<leader>6', "'C", { desc = 'Go to camera location 3' })
map('n', '<leader>7', "'D", { desc = 'Go to camera location 4' })
map('n', "'4", "mA", { desc = 'Set camera location 1' })
map('n', "'5", "mB", { desc = 'Set camera location 2' })
map('n', "'6", "mC", { desc = 'Set camera location 3' })
map('n', "'7", "mD", { desc = 'Set camera location 4' })

