require("neodev").setup {}

local lspconfig = require("lspconfig")
local defaults = lspconfig.util.default_config

defaults.capabilities = vim.tbl_deep_extend(
  'force',
  defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

local function setup_mappings(bufnr)
    local builtin = require('telescope.builtin')

    local withTheme = function(f)
        local theme = require('telescope.themes').get_dropdown({})
        return function ()
            f(theme)
        end
    end

    local map_helper = function(mode, keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
    end

    local nmap = function(keys, func, desc)
        map_helper('n', keys, func, desc)
    end

    local imap = function(keys, func, desc)
        map_helper('i', keys, func, desc)
    end


    nmap('<leader>e', vim.diagnostic.open_float, 'Show [E]rrors')
    nmap('<leader>q', vim.diagnostic.setloclist, 'Show Location List')
    nmap('[d', vim.diagnostic.goto_prev, 'Goto Previous [D]iagnostic')
    nmap(']d', vim.diagnostic.goto_next, 'Goto Next [D]iagnostic')

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', withTheme(builtin.lsp_references), '[G]oto [R]eferences')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', withTheme(builtin.lsp_document_symbols), '[D]ocument [S]ymbols')
    nmap('<leader>ws', withTheme(builtin.lsp_dynamic_workspace_symbols), '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- I want signature help in insert mode
    imap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')


    nmap('<leader>bf', vim.cmd.Neoformat, '[B]uffer [F]ormat')
end

local function default_server_handler(server)
    require('lspconfig')[server].setup {
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

        local command = vim.api.nvim_buf_create_user_command
        command(buf, "LspFormat", function()
            vim.lsp.buf.format()
        end, { desc = "Format buffer with language server" })
    end
})

require("mason").setup {}
require("mason-lspconfig").setup {
    handlers = {
        default_server_handler,
    }
}

local cmp = require("cmp")

-- See https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#super-tab-like-mapping
function HasWordsBefore()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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

cmp.setup {
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" }
    },
    mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping(HandleTabPress, {"i", "s"}),
        ['<S-Tab>'] = cmp.mapping(HandleShiftTabPress, {"i", "s"}),
        ['<C-Space>'] = cmp.mapping(HandleCtrlSpacePress, {"i", "s"}),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    }
}

