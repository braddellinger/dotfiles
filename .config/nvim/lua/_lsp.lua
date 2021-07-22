-- Diagnostic signs
vim.fn.sign_define('LspDiagnosticsSignError', { text = '', texthl = 'LspDiagnosticsSignError', linehl = '', numhl = '' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = '', texthl = 'LspDiagnosticsSignWarning', linehl = '', numhl = '' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = '', texthl = 'LspDiagnosticsSignInformation', linehl = '', numhl = '' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = '', texthl = 'LspDiagnosticsSignHint', linehl = '', numhl = '' })

-- Floating window border colors
vim.cmd('autocmd ColorScheme * highlight NormalFloat guibg=#172028')
vim.cmd('autocmd ColorScheme * highlight FloatBorder guifg=#95ffa4 guibg=#172028')

-- Lsp setup
require'lspconfig'.tsserver.setup{ }
require'lspconfig'.pyright.setup{ }
require'lspconfig'.jsonls.setup{ }
require'lspconfig'.yamlls.setup{ }
require'lspconfig'.vimls.setup{ }
require'lspconfig'.cssls.setup{ }
require'lspconfig'.html.setup{ }
require'lspconfig'.gopls.setup{
    cmd = { 'gopls', 'serve' },
    settings = {
        gopls = {
            analyses = { unusedparams = true  },
            staticcheck = true,
        }
    }
}

-- Custom on_attach function
local on_attach = function(client, bufnr)

    -- Border styles
    local border = {
          { '🭽', 'FloatBorder' },
          { '▔', 'FloatBorder' },
          { '🭾', 'FloatBorder' },
          { '▕', 'FloatBorder' },
          { '🭿', 'FloatBorder' },
          { '▁', 'FloatBorder' },
          { '🭼', 'FloatBorder' },
          { '▏', 'FloatBorder' }
    }

    -- Apply borders to hover and signature
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
    vim.lsp.handlers['textDocument/completion'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Keymaps
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gs', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', 'gT', ':lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'gR', ':lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', ':lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Keymaps for auto-formatting
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap('n', 'gf', ':lua vim.lsp.buf.formatting()<CR>', opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap('n', 'gf', ':lua vim.lsp.buf.range_formatting()<CR>', opts)
    end

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

-- Disable virtual text
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        update_in_insert = false,
        virtual_text = false,
        underline = true,
        signs = true
    }
)

-- Display line diagnostics on cursor hold
vim.o.updatetime = 250
vim.cmd('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')
vim.cmd('autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()')

