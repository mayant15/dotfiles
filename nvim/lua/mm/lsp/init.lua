require('neodev').setup {}

local lspconfig = require("lspconfig")
local defaults = lspconfig.util.default_config

defaults.capabilities = vim.tbl_deep_extend(
    'force',
    defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local setup_mappings = require("mm.lsp.on_attach").setup_mappings

local function default_server_handler(server)
    require('lspconfig')[server].setup {
        --  NOTE: We probably don't need this here if we call
        -- setup_mappings on LspAttach event below
        -- on_attach = function(client, bufnr)
        --     setup_mappings(bufnr)
        -- end
    }
end

vim.api.nvim_create_autocmd('LspAttach', {
    desc = "LSP Actions",
    callback = function(event)
        local buf = event.buf
        setup_mappings(buf)
    end
})

require("mason").setup {}
require("mason-lspconfig").setup {
    handlers = {
        default_server_handler,
    }
}

lspconfig.zls.setup {
    on_attach = function(_, bufnr)
        setup_mappings(bufnr)
    end
}

lspconfig.texlab.setup {
    on_attach = function(_, bufnr)
        setup_mappings(bufnr)
    end,
    settings = {
        texlab = {
            chktex = {
                onOpenAndSave = true
            }
        }
    }
}

lspconfig.ltex.setup {
    filetypes = { "bib", "tex", "markdown" },
    settings = {
        ltex = {
            enabled = {"bibtex", "latex", "markdown"},
            language = "en-CA",
            additionalRules = {
                enablePickyRules = true,
            }
        }
    },
    on_attach = function(_, bufnr)
        setup_mappings(bufnr)
        require('ltex_extra').setup {}
    end
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
    on_attach = function(_, bufnr)
        setup_mappings(bufnr)
    end
}

lspconfig.elvish.setup {}

local cmp = require("cmp")

-- See https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#super-tab-like-mapping
function HasWordsBefore()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

function HandleTabPress(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif HasWordsBefore() then
        cmp.complete()
    else
        fallback()
    end
end

function HandleShiftTabPress(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

function HandleCtrlSpacePress(fallback)
    if not cmp.visible() then
        cmp.complete()
    else
        fallback()
    end
end

local lspkind = require("lspkind")

cmp.setup {
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
        { name = "neorg" }
    },
    mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- ['<Tab>'] = cmp.mapping(HandleTabPress, {"i", "s"}),

        ['<Tab>'] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),

        ['<S-Tab>'] = cmp.mapping(HandleShiftTabPress, { "i", "s" }),
        ['<C-Space>'] = cmp.mapping(HandleCtrlSpacePress, { "i", "s" }),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
}
