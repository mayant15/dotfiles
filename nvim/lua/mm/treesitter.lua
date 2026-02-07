require("nvim-treesitter.configs").setup {
    sync_install = false,
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}

vim.wo.foldenable = false
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.filetype.add {
    extension = {
        tf = "traffic"
    }
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.traffic = {
    install_info = {
        url = vim.fn.expand("~/code/traffic/tree-sitter-traffic"),
        files = { "src/parser.c" },
    },
}
