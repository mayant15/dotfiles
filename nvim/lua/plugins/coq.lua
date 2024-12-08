return {
    {
        "whonore/Coqtail",
        config = function()
            vim.g.loaded_coqtail = 1
            vim.g['coqtail#supported'] = 0
        end
    },
    {
        "tomtomjhj/coq-lsp.nvim",
        dependencies = {
            "whonore/Coqtail"
        },
        opts = {}
    }
}
