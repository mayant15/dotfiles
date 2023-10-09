return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("mm.lsp")
        end,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",

            -- REQUIRED
            "L3MON4D3/LuaSnip"
        }
    },
    {
        "folke/neodev.nvim",
        opts = {}
    },
    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        event = "LspAttach",
        config = true
    },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "mfussenegger/nvim-dap",
        }
    }
}
