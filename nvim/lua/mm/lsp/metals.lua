-- From https://github.com/scalameta/nvim-metals/discussions/39

local metals_config = require("metals").bare_config()
metals_config.settings = {
    showImplicitArguments = true
}

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

metals_config.on_attach = function(_, bufnr)
    require("mm.lsp.on_attach").setup_mappings(bufnr)

    -- Shortcut to bring up all Metals commands
    vim.keymap.set('n', '<leader>mc', function()
        require("telescope").extensions.metals.commands()
    end, { buffer = bufnr, desc = "Show all [M]etals [C]ommands" })
end

require("metals").initialize_or_attach(metals_config)

-- local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })


-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "scala", "sbt", "java" },
--     callback = function()
--         require("metals").initialize_or_attach(metals_config)
--     end,
--     group = nvim_metals_group,
-- })
--
