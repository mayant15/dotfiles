local lspconfig = require("lspconfig")
local defaults = lspconfig.util.default_config

defaults.capabilities = vim.tbl_deep_extend(
    'force',
    defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local setup_mappings = require("mm.lsp.on_attach").setup_mappings

vim.api.nvim_create_autocmd('LspAttach', {
    desc = "LSP Actions",
    callback = function(event)
        local buf = event.buf
        setup_mappings(buf)
    end
})

require("mason").setup {}
require("mason-lspconfig").setup {}

lspconfig.zls.setup {}

lspconfig.texlab.setup {
    settings = {
        texlab = {
            chktex = {
                onOpenAndSave = true
            }
        }
    }
}

lspconfig.ltex.setup {
    filetypes = { "tex", "markdown" },
    settings = {
        ltex = {
            language = "en-CA",
            additionalRules = {
                enablePickyRules = true,
            }
        }
    },
}

require('lspconfig.configs').elvish = {
    default_config = {
        cmd = { 'elvish', '-lsp' },
        filetypes = { 'elvish' },
        root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname)
        end,
        settings = {}
    },
}

lspconfig.elvish.setup {}

local cmp = require("cmp")

cmp.setup {
    completion = {
        autocomplete = false,
    },
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
        { name = "neorg" }
    },
    mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
}
