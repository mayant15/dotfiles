return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")
            configs.setup {
                ensure_installed = {"lua"},
                -- auto_install = true,
                sync_install = false,
                incremental_selection = { enable = true },
                highlight = { enable = true },
                indent = { enable = true },  
            }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            max_lines = 2,
        }
    }
}
