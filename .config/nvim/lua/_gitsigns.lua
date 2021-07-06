-- Gitsigns setup
-- Thick sign:┃
-- Thin sign: │
require('gitsigns').setup {
    signs = {
        add          = { hl = 'GitSignsAdd',    text = '┃', numhl = 'GitSignsAddNr',    linehl = 'GitSignsAddLn'    },
        change       = { hl = 'GitSignsChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
    numhl = false,
    linehl = false,
    keymaps = {
        noremap = true,
        buffer = true,

        -- Navigate between hunks
        ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
        ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

        -- Utilities
        ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

        -- Text objects
        ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
        ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
    },
    watch_index = { interval = 1000 },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    use_decoration_api = true,
    use_internal_diff = true,
}
