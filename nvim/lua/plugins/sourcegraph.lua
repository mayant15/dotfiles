return {
    {
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("mm.lsp.sourcegraph")
        end,
        keys = {
            {
                "<leader>ss",
                function()
                    local ts = require("sg.extensions.telescope")
                    ts.fuzzy_search_results()
                end,
                desc = "[S]ourcegraph [S]earch"
            }
        }
    }
}
