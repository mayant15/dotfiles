local map = vim.keymap.set

-- No arrow keys :D
map('', '<Up>', '<Nop>', { noremap = true })
map('', '<Down>', '<Nop>', { noremap = true })
map('', '<Right>', '<Nop>', { noremap = true })
map('', '<Left>', '<Nop>', { noremap = true })

-- Space is leader
map({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

-- Telescope
local builtin = require('telescope.builtin')
local withTheme = function(f)
    local theme = require('telescope.themes').get_dropdown({})
    return function ()
        f(theme)
    end
end

-- From https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
map('n', '<leader>?', withTheme(builtin.oldfiles), { desc = '[?] Find recently opened files' })
map('n', '<leader>sb', withTheme(builtin.buffers), { desc = '[S]earch existing [B]uffers' })
-- map('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer]' })

map('n', '<leader><space>', withTheme(builtin.find_files), { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', withTheme(builtin.help_tags), { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', withTheme(builtin.grep_string), { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', withTheme(builtin.live_grep), { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', withTheme(builtin.diagnostics), { desc = '[S]earch [D]iagnostics' })

-- File explorer
map('n', '<leader>1', ':Ex!<CR>', {noremap = true})

-- Buffers
map('n', '[b', vim.cmd.bprevious)
map('n', ']b', vim.cmd.bnext)

