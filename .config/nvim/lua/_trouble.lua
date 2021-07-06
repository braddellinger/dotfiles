-- Trouble settings
-- For telescope integration, reference _telescope.lua
require('trouble').setup {
    position = 'right', -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = 'lsp_workspace_diagnostics', -- 'lsp_workspace_diagnostics', 'lsp_document_diagnostics', 'quickfix', 'lsp_references', 'loclist'
    fold_open = '', -- icon used for open folds
    fold_closed = '', -- icon used for closed folds
    action_keys = { -- key mappings for actions in the trouble list
        close = 'q', -- close the list
        cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
        refresh = 'r', -- manually refresh
        jump = { '<cr>', '<tab>' }, -- jump to the diagnostic or open / close folds
        jump_close = { 'o' }, -- jump to the diagnostic and close the list
        toggle_mode = 'm', -- toggle between 'workspace' and 'document' diagnostics mode
        toggle_preview = 'P', -- toggle auto_preview
        hover = 'K', -- opens a small poup with the full multiline message
        preview = 'p', -- preview the diagnostic location
        close_folds = {'zM', 'zm'}, -- close all folds
        open_folds = {'zR', 'zr'}, -- open all folds
        toggle_fold = {'zA', 'za'}, -- toggle fold of current file
        previous = 'k', -- preview item
        next = 'j' -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatyically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    signs = {
        -- icons / text used for a diagnostic
        error = '',
        warning = '',
        hint = '',
        information = '',
        other = ''
    },
    use_lsp_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

-- Keymaps
vim.api.nvim_set_keymap('n', '<leader>xx', ':Trouble<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xw', ':Trouble lsp_workspace_diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xd', ':Trouble lsp_document_diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xl', ':Trouble loclist<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xq', ':Trouble quickfix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gR', ':Trouble lsp_references<CR>', { noremap = true, silent = true })

