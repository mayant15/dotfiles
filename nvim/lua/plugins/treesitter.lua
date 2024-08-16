return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup {
                ensure_installed = {"lua"},
                auto_install = false,
                ignore_install = {},
                sync_install = false,
                incremental_selection = { enable = true },
                highlight = { enable = true },
                indent = { enable = true },
            }
        end
    }
}
