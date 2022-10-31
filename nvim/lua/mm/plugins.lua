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
                options = { theme = 'onedark' },
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
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require'gitsigns'.setup {
                current_line_blame = true
            }
        end
    }

	-- Appearance
	use {
        'navarasu/onedark.nvim',
        config = function()
            local onedark = require'onedark'
            onedark.setup {
                style = 'darker'
            }
            onedark.load()
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
        'folke/zen-mode.nvim',
        requires = {
            'folke/twilight.nvim'
        },
        config = function()
            require'zen-mode'.setup {
                window = { width = 0.7 },
                plugins = { twilight = { enabled = true } }
            }
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
                incremental_selection = { enable = false },
                highlight = { enable = true },
                indent = { enable = true }
            }
        end
    }
end)

local telescope = require'telescope'
telescope.setup {
    extensions = {
        file_browser = { theme = "ivy", hijack_netrw = false }
    }
}
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

