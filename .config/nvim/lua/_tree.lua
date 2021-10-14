vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local keybindings = {
    { key = {'<CR>', 'o', '<2-LeftMouse>'}, cb = tree_cb('edit') },
    { key = '<C-v>',                        cb = tree_cb('vsplit') },
    { key = '<C-s>',                        cb = tree_cb('split') },
    { key = '<C-t>',                        cb = tree_cb('tabnew') },
    { key = '<Tab>',                        cb = tree_cb('preview') },
    { key = 'R',                            cb = tree_cb('refresh') },
    { key = 'c',                            cb = tree_cb('create') },
    { key = 'd',                            cb = tree_cb('remove') },
    { key = 'r',                            cb = tree_cb('rename') },
    { key = 'x',                            cb = tree_cb('cut') },
    { key = 'p',                            cb = tree_cb('paste') },
    { key = '?',                            cb = tree_cb('toggle_help') }
}

require('nvim-tree').setup {
    lsp_diagnostics    = false,
    disable_netrw      = true,
    open_on_setup      = false,
    hijack_cursor      = false,
    hijack_netrw       = true,
    open_on_tab        = false,
    auto_close         = false,
    update_cwd         = false,
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = { }
    },
    update_to_buf_dir  = {
        auto_open = true,
        enable    = true
    },
    system_open = {
        cmd  = nil,
        args = { }
    },
    view = {
        auto_resize = false,
        side        = 'right',
        height      = 30,
        width       = 30,
        mappings = {
            custom_only = false,
            list = { keybindings }
        }
    },
    ignore_ft_on_setup = { }
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = '',
        staged = '✓',
        unmerged = '',
        renamed = '➜',
        untracked = '',
    },
    folder = {
        default = '',
        open = '',
        symlink = '',
    }
}

