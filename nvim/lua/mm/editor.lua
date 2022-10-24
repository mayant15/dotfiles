local ops = vim.o

-- filetype plugin indent on

-- Encoding
ops.enc = 'utf-8'
ops.fenc = 'utf-8'
ops.termencoding = 'utf-8'

-- Indentation
ops.autoindent = true
ops.smartindent = true
ops.tabstop = 4
ops.shiftwidth = 4
ops.expandtab = true

ops.textwidth = 120

-- Line numbers
ops.rnu = true
ops.nu = true

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

