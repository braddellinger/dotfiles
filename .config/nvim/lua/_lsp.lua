-- Diagnostic signs
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticError', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticInfo', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticHint', linehl = '', numhl = '' })

-- Lsp setup
require('lspconfig').tsserver.setup { }
require('lspconfig').pyright.setup { }
require('lspconfig').jsonls.setup { }
require('lspconfig').yamlls.setup { }
require('lspconfig').cssls.setup { }
require('lspconfig').html.setup { }
require'lspconfig'.eslint.setup{ }
require('lspconfig').gopls.setup {
    cmd = { 'gopls', 'serve' },
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
        }
    }
}

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Custom on_attach function
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently setup all LSP servers 
local servers = { 'tsserver', 'pyright', 'jsonls', 'yamlls', 'gopls', 'vimls', 'cssls', 'html' }
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup { on_attach = on_attach }
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

-- Diagnostic popup configurations
vim.diagnostic.config({
    float = {
        prefix = function(diagnostic, i, total)
            sign = '?'
            hl = ''
            if diagnostic.severity == 4 then
                sign = ''
                hl = 'DiagnosticHint'
            elseif diagnostic.severity == 3 then
                sign = ''
                hl = 'DiagnosticInfo'
            elseif diagnostic.severity == 2 then
                sign = ''
                hl = 'DiagnosticWarn'
            elseif diagnostic.severity == 1 then
                sign = ''
                hl = 'DiagnosticError'
            end
            return sign .. '  ', hl
        end,
        border = vim.g.border,
        focusable = false,
        header = ''
    },
    update_in_insert = false,
    severity_sort = true,
    virtual_text = false,
    underline = true
})

-- Display line diagnostics on cursor hold
vim.cmd('autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()')
vim.cmd('autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()')
