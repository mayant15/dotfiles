return {
    {
        "nvim-neorg/neorg",
        cmd = "Neorg",
        dependencies = {
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
            },
            { "gO", mode = "n", ":Neorg toc left<CR>"}
        },
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.export"] = {},
                ["core.keybinds"] = {},
                ["core.integrations.nvim-cmp"] = {},
                ["core.integrations.treesitter"] = {},
                ["core.export"] = {},
                ["core.export.markdown"] = {},
                ["core.summary"] = {},
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
                ["core.esupports.metagen"] = {
                    config = {
                        template = {
                            { "title" },
                            { "categories" }
                        }
                    }
                }
            }
        }
    }
}
