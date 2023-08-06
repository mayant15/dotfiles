vim.cmd [[packadd packer.nvim]]

require'packer'.startup (function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    use 'lewis6991/impatient.nvim'

    -- NOTE: Config for this is in lsp_zero.lua
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'}, -- Required
        }
    }

    -- LSP Status
    -- use {
    --     'j-hui/fidget.nvim',
    --     config = function ()
    --         require'fidget'.setup {}
    --     end,
    --     tag = 'legacy'
    -- }

    -- Information
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require'lualine'.setup {
                -- options = { theme = 'everforest' },
                -- options = { theme = 'catppuccin' },
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
    }

    -- Themes
    -- use 'navarasu/onedark.nvim'
    -- use 'doums/darcula'
    -- use { "catppuccin/nvim", as = "catppuccin" }


    -- Editing
    use {
        'windwp/nvim-autopairs',
        config = function()
            require'nvim-autopairs'.setup {}
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require'Comment'.setup {}
        end
    }

    -- Finder
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {"lua", "markdown", "markdown_inline"},
                auto_install = true,
                sync_install = false,
                incremental_selection = { enable = true },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "markdown" },
                },
                indent = { enable = true }
            }
        end
    }


    use {
        'gpanders/editorconfig.nvim',
        config = function()
            require("editorconfig")
        end
    }

    use({
        "epwalsh/obsidian.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("obsidian").setup({
                dir = "~/Documents/obsidian-vault",
                notes_subdir = "Notes",
                daily_notes = {
                    folder = "Calendar/Daily",
                },
                completion = {
                    nvim_cmp = true,
                    min_chars = 2,
                    new_notes_location = "notes_subdir",
                },
                mappings = {
                    ["gf"] = require("obsidian.mapping").gf_passthrough(),
                },
                templates = {
                    subdir = "Templates",
                }
            })
        end,
    })

--[[



    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require'gitsigns'.setup {}
        end
    }


    use 'nvim-treesitter/nvim-treesitter-context'

    use 'sbdchd/neoformat'

    use {
        'folke/zen-mode.nvim',
        config = function()
            require('zen-mode').setup {
                window = {
                    options = {
                        number = true,
                        relativenumber = true,
                        cursorline = true
                    }
                }
            }
        end
    }

    use {
        'akinsho/bufferline.nvim',
        config = function()
            require('bufferline').setup {}
        end
    }

    use {
'ggandor/lightspeed.nvim',
        config = function()
            require('lightspeed').setup {}
        end
    }

    use 'wakatime/vim-wakatime'


    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require'indent_blankline'.setup {
                show_current_context = true,
                use_treesitter = true,
            }
        end
    }


    --]]
end)

local telescope = require'telescope'
telescope.setup {}
telescope.load_extension('fzf')

