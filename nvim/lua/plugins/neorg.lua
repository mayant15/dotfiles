return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "nvim-neorg/neorg",
        dependencies = {
            "luarocks.nvim",
            "nvim-cmp"
        },
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },
                    ["core.integrations.nvim-cmp"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/code/journal/data"
                            }
                        }
                    },
                    ["core.summary"] = {},
                    ["core.ui.calendar"] = {}
                }
            }
        end
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },
}
