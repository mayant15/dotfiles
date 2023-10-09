require("sg").setup {
    on_attach = function(_, buf)
        require("mm.lsp.on_attach").setup_mappings(buf)
    end
}
