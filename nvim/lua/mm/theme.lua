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
vim.g.ayucolor = 'mirage'
vim.g.ayu_extended_palette = 1
vim.g.ayu_italic_comment = 1
vim.cmd [[colorscheme ayu]]

-- Nord
-- vim.g.nord_bold_vertical_split_line = 1
-- vim.g.nord_bold = 1
-- vim.g.nord_italic = 1
-- vim.g.nord_italic_comments = 1
-- vim.g.nord_underline = 1
-- vim.cmd [[colorscheme nord]]
