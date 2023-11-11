return {
    {
        'Julian/lean.nvim',
        event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-lua/plenary.nvim',
            -- you also will likely want nvim-cmp or some completion engine
        },

        -- see details below for full configuration options
        config = function ()
            local setup_mappings = require('mm.lsp.on_attach').setup_mappings
            require('lean').setup {
                lsp = {
                    on_attach = function (_, buf)
                        setup_mappings(buf)
                    end,
                },
                mappings = true,
            }
        end
    }
}
