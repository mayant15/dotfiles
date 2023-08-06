require'impatient'

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require'mm.plugins'
-- require'mm.lsp'
require'mm.lsp_zero'
require'mm.editor'
require'mm.mappings'
-- require'mm.theme'

