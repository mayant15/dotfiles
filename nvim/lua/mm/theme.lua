local ops = vim.o

-- Builtins
ops.termguicolors = true
ops.background = 'dark'
ops.signcolumn = 'yes'
ops.laststatus = 2
ops.noshowmode = true

-- Theme
require('catppuccin').setup {
    flavour = "mocha",
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15
    },
    integrations = {
        gitsigns = true,
        cmp = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        mason = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true
        }
    }
}
vim.cmd.colorscheme "catppuccin"
