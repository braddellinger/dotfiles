-- Lsp diagnostic signs
vim.fn.sign_define('LspDiagnosticsSignError', { text = '', texthl = 'LspDiagnosticsSignError', linehl = '', numhl = '' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = '', texthl = 'LspDiagnosticsSignWarning', linehl = '', numhl = '' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = '', texthl = 'LspDiagnosticsSignInformation', linehl = '', numhl = '' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = '', texthl = 'LspDiagnosticsSignHint', linehl = '', numhl = '' })

-- Lsp setup
require'lspconfig'.tsserver.setup{ }
require'lspconfig'.pyright.setup{ }
require'lspconfig'.jsonls.setup{ }
require'lspconfig'.yamlls.setup{ }
require'lspconfig'.gopls.setup{
    cmd = { 'gopls', 'serve' },
    settings = {
        gopls = {
            analyses = { unusedparams = true  },
            staticcheck = true,
        }
    }
}
require'lspconfig'.vimls.setup{ }
require'lspconfig'.cssls.setup{ }
require'lspconfig'.html.setup{ }

-- Keymaps
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap = true, silent = true }
    -- buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', 'gs', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', 'gT', ':lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', 'gR', ':lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', ':lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap('n', 'gf', ':lua vim.lsp.buf.formatting()<CR>', opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap('n', 'gf', ':lua vim.lsp.buf.range_formatting()<CR>', opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            hi LspReferenceRead guibg=#4c4d60
            hi LspReferenceText guibg=#4c4d60
            hi LspReferenceWrite guibg=#4c4d60
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { 'tsserver', 'pyright', 'jsonls', 'yamlls', 'gopls', 'vimls', 'cssls', 'html' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- Go: Organize imports on save
function goimports(timeout_ms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, 't', true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    if action.edit or type(action.command) == 'table' then
        if action.edit then
            vim.lsp.util.apply_workspace_edit(action.edit)
        end
        if type(action.command) == 'table' then
            vim.lsp.buf.execute_command(action.command)
        end
    else
        vim.lsp.buf.execute_command(action)
    end
end
vim.cmd('autocmd BufWritePre *.go lua goimports(1000)')



-- vim.g.virtual_text_active = true
-- function _G.toggle_virtual_text()
--     if vim.g.virtual_text_active then
--         vim.g.virtual_text_active = false
--         vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--             vim.lsp.diagnostic.on_publish_diagnostics, {
--                 update_in_insert = false,
--                 virtual_text = false,
--                 underline = true,
--                 signs = true
--             }
--         )
--     else
--         vim.g.virtual_text_active = true
--         vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--             vim.lsp.diagnostic.on_publish_diagnostics, {
--                 update_in_insert = false,
--                 virtual_text = true,
--                 underline = true,
--                 signs = true
--             }
--         )
--     end
-- end

-- vim.api.nvim_set_keymap('n', '<leader>v', ':call v:lua.toggle_virtual_text()<CR>',  { noremap = true, silent = true })
