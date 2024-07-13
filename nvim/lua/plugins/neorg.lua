return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        opts = {
            rocks = { "magick" }
        }
    },
    {
        "nvim-neorg/neorg",
        lazy = false,
        dependencies = {
            "luarocks.nvim",
            "nvim-cmp"
        },
        keys = {
            {
                "<leader>nn",
                mode = "n",
                function()
                    vim.ui.input({
                        prompt = 'New note: ',
                    }, function(name)
                            if (name ~= nil and name ~= '') then
                                local dirman = require('neorg').modules.get_module("core.dirman")
                                dirman.create_file('notes/' .. name, 'notes', {
                                    no_open = false,
                                    force = false,
                                    metadata = {},
                                })
                            end
                        end
                    )
                end
            }
        },
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.neorgcmd"] = {},
                    ["core.autocommands"] = {},
                    ["core.highlights"] = {},
                    ["core.integrations.nvim-cmp"] = {},
                    ["core.integrations.image"] = {},
                    ["core.integrations.treesitter"] = {},
                    ["core.mode"] = {},
                    ["core.queries.native"] = {},
                    ["core.ui"] = {},
                    ["core.latex.renderer"] = {},
                    ["core.concealer"] = {
                        config = {
                            icon_preset = 'diamond'
                        }
                    },
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/code/journal/data"
                            },
                            use_popup = false,
                        }
                    },
                    ["core.keybinds"] = {
                        config = {
                            hook = function(keybinds)
                                keybinds.unmap("norg", "n", keybinds.leader .. "nn")
                            end
                        }
                    },
                    ["core.presenter"] = {
                        config = {
                            zen_mode = "zen-mode"
                        }
                    }
                }
            }
        end
    },
    {
        "3rd/image.nvim",
        dependencies = { "luarocks.nvim" },
        opts = {
            backend = "kitty"
        }
    }
}
