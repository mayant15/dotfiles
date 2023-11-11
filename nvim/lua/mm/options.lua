local ops = vim.o

-- ===============================================
-- THEME

ops.termguicolors = true
ops.background = 'dark'
ops.signcolumn = 'yes'
ops.laststatus = 2
ops.noshowmode = true

-- ===============================================
-- EDITING

-- Encoding
ops.enc = 'utf-8'
ops.fenc = 'utf-8'
ops.termencoding = 'utf-8'

-- Indentation
ops.autoindent = true
ops.smartindent = true
ops.tabstop = 2
ops.shiftwidth = 0 -- Use tabstop as shiftwidth
ops.expandtab = true

ops.textwidth = 120

ops.incsearch = true
ops.hlsearch = true

ops.cul = true

-- Line numbers
ops.rnu = true
ops.nu = true

ops.mouse = 'a'

-- Code folding, courtesy of tree-sitter
ops.foldenable = false
ops.foldmethod = 'expr'
ops.foldexpr = 'nvim_treesitter#foldexpr()'

-- ===============================================
-- netrw

vim.g.netrw_bufsettings = 'noma nomod nowrap ro nobl rnu'
