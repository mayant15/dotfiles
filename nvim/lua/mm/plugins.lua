vim.cmd [[packadd packer.nvim]]

require'packer'.startup (function(use)
	-- Packer manages itself
	use 'wbthomason/packer.nvim'

	-- LSP and autocompletion
	use 'neovim/nvim-lspconfig'

	-- Completion plugins
	use 'hrsh7th/nvim-cmp'

	-- Completion sources
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	-- Information
	use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require'lualine'.setup {
                options = { theme = 'ayu_mirage' },
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
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require'gitsigns'.setup {}
        end
    }

	-- Appearance
	use 'Luxed/ayu-vim'
    -- use 'arcticicestudio/nord-vim'

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
                incremental_selection = { enable = true },
                highlight = { enable = true },
                indent = { enable = true }
            }
        end
    }
end)

local telescope = require'telescope'
telescope.setup {}
telescope.load_extension('fzf')

