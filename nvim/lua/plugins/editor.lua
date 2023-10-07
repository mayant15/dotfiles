return {
    {
        'numToStr/Comment.nvim',
        config = true
    },
    {
        'windwp/nvim-autopairs',
        config = true
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
        opts = {
            scope = {
                show_start = false
            }
        }
    },
    {
        'folke/zen-mode.nvim',
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
        opts = {
            options = { theme = 'modus-vivendi' },
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
    },
    {
        'lewis6991/gitsigns.nvim',
        config = true
    }
}
