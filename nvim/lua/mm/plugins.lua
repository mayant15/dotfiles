vim.cmd [[packadd packer.nvim]]

require'packer'.startup (function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

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
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Information
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require'lualine'.setup {
                options = { theme = 'rose-pine' },
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

    -- use {
    --     'lewis6991/gitsigns.nvim',
    --     config = function()
    --         require'gitsigns'.setup {}
    --     end
    -- }

    use 'tpope/vim-fugitive'

    -- Appearance
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require'indent_blankline'.setup {}
        end
    }

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
            }

            require'nvim-treesitter.configs'.setup {
                ensure_installed = {"help", "typescript", "cpp", "lua", "rust" },
                auto_install = true,
                sync_install = false,
                incremental_selection = { enable = true },
                highlight = { enable = true },
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

end)

local telescope = require'telescope'
telescope.setup {}
telescope.load_extension('fzf')

