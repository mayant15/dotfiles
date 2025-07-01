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
        'j-hui/fidget.nvim',
        opts = {}
    }
}
