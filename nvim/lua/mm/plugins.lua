-- Disable netrw for nvim-tree
-- https://github.com/nvim-tree/nvim-tree.lua#setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[packadd packer.nvim]]

require'packer'.startup (function(use)
	-- Packer manages itself
	use 'wbthomason/packer.nvim'

	-- LSP and autocompletion
	use 'neovim/nvim-lspconfig'

	-- Completion plugins
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/vim-vsnip'

	-- Completion sources
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-vsnip'

	-- Information
	use 'nvim-lualine/lualine.nvim'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons'
		}
	}

	-- Appearance
	use 'Luxed/ayu-vim'
	use 'lukas-reineke/indent-blankline.nvim'

	-- Editing
	use 'windwp/nvim-autopairs'

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
        run = ':TSUpdate'
    }
end)

require'lualine'.setup {}
require'indent_blankline'.setup {}
require'nvim-autopairs'.setup {}
require'nvim-tree'.setup {
	view = {
		side = "right"
	}
}

local telescope = require'telescope'
telescope.setup {}
telescope.load_extension('fzf')

