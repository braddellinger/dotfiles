vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        untracked = '',
        unstaged = '',
        unmerged = '',
        staged = '✓',
        renamed = '➜'
    },
    folder = {
        default = '',
        symlink = '',
        open = ''
    }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local keybindings = {
    { key = {'<CR>', 'o', '<2-LeftMouse>'}, cb = tree_cb('edit') },
    { key = '<Tab>', cb = tree_cb('preview') },
    { key = '?', cb = tree_cb('toggle_help') },
    { key = '<C-v>', cb = tree_cb('vsplit') },
    { key = '<C-t>', cb = tree_cb('tabnew') },
    { key = '<C-s>', cb = tree_cb('split') },
    { key = 'R', cb = tree_cb('refresh') },
    { key = 'c', cb = tree_cb('create') },
    { key = 'd', cb = tree_cb('remove') },
    { key = 'r', cb = tree_cb('rename') },
    { key = 'p', cb = tree_cb('paste') },
    { key = 'x', cb = tree_cb('cut') }
}

require('nvim-tree').setup {
    hijack_cursor = false,
    open_on_setup = false,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    update_cwd = false,
    auto_close = false,
    update_focused_file = {
        update_cwd = false,
        ignore_list = { },
        enable = false
    },
    view = {
        hide_root_folder = false,
        relativenumber = false,
        auto_resize = false,
        signcolumn = true,
        number = false,
        side = 'right',
        height = 30,
        width = 30,
        mappings = {
            list = { keybindings },
            custom_only = false
        }
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500
    },
    filters = {
        dotfiles = false,
        custom = { }
    },
    update_to_buf_dir = {
        auto_open = true,
        enable = true
    },
    system_open = {
        args = { },
        cmd = nil
    },
    diagnostics = {
        enable = false,
        icons = { }
    },
    system_open = {
        cmd = nil,
        args = { }
    },
    trash = {
        require_confirm = true,
        cmd = 'trash'
    },
    ignore_ft_on_setup = { }
}

