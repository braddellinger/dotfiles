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

require('nvim-tree').setup {
    hijack_unnamed_buffer_when_opening = false,
    auto_reload_on_write = true,
    hijack_cursor = false,
    disable_netrw = false,
    open_on_setup = false,
    open_on_tab = false,
    hijack_netrw = true,
    update_cwd = false,
    actions = {
        change_dir = {
            global = false,
            enable = true
        },
        open_file = {
            quit_on_open = false,
            window_picker = {
                chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
                enable = true,
                exclude = {
                    filetype = {
                        'notify',
                        'packer',
                        'qf'
                    }
                }
            }
        }
    },
    view = {
        hide_root_folder = false,
        relativenumber = false,
        signcolumn = 'yes',
        number = false,
        side = 'right',
        height = 30,
        width = 30,
        mappings = {
            list = {
                { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
                { key = '<Tab>', action = 'preview' },
                { key = '?', action = 'toggle_help' },
                { key = '<C-v>', action = 'vsplit' },
                { key = '<C-t>', action = 'tabnew' },
                { key = '<C-s>', action = 'split' },
                { key = 'R', action = 'refresh' },
                { key = 'c', action = 'create' },
                { key = 'd', action = 'remove' },
                { key = 'r', action = 'rename' },
                { key = 'p', action = 'paste' },
                { key = 'x', action = 'cut' }
            },
            custom_only = false
        }
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = '  ',
                edge = '  ',
                none = '  '
            }
        },
        icons = {
            git_placement = 'before',
            webdev_colors = true
        }
    },
    git = {
        enable = false,
        ignore = true,
        timeout = 500
    },
    update_focused_file = {
        update_cwd = false,
        ignore_list = { },
        enable = false
    },
    filters = {
        dotfiles = false,
        custom = { }
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
    hijack_directories = {
        auto_open = true,
        enable = true
    },
    ignore_ft_on_setup = { }
}

