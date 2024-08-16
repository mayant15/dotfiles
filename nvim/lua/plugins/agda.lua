return {
    {
        "isovector/cornelis",
        enabled = false,
        ft = "agda",
        dependencies = {
            "kana/vim-textobj-user",
            "neovimhaskell/nvim-hs.vim"
        },
        build = "stack build",
        keys = { "<leader>al", mode = "n", ":CornelisLoad<CR>", desc = "Load and type-check Agda buffer" }
    }
}
