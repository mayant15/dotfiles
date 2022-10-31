local ops = vim.o

-- Builtins
ops.hlsearch = true
ops.cul = true
ops.termguicolors = true
ops.background = 'dark'
ops.signcolumn = 'yes'
ops.laststatus = 2
ops.noshowmode = true

-- Theme plugin
vim.cmd [[colorscheme onedark]]

