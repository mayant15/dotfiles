return {
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    {
        'windwp/nvim-autopairs',
        opts = {}
    },
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        config = function()
            local highlight = {
                "MutedIndent"
            }
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "MutedIndent", { fg = "#23212f" })
            end)
            require("ibl").setup {
                indent = { highlight = highlight },
                scope = { show_start = false }
            }
        end
    },
    {
        'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        opts = {
            window = {
                options = {
                    number = true,
                    relativenumber = true,
                    cursorline = true
                }
            }
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local theme = require('lualine.themes.rose-pine')
            require('lualine').setup {
                options = { theme = theme },
                sections = {
                    lualine_c = {
                        {
                            'filename',
                            file_status = true,
                            newfile_status = true,
                            path = 1,
                        }
                    }
                }
            }
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        opts = {}
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {}
    },
    { 'sindrets/diffview.nvim' },
}
