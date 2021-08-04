-- Tree settings
vim.g.nvim_tree_side = 'right'

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    { key = {'<CR>', 'o'}, cb = tree_cb('edit') },
    { key = '<C-v>',       cb = tree_cb('vsplit') },
    { key = '<C-s>',       cb = tree_cb('split') },
    { key = '<C-t>',       cb = tree_cb('tabnew') },
    { key = '<Tab>',       cb = tree_cb('preview') },
    { key = 'R',           cb = tree_cb('refresh') },
    { key = 'c',           cb = tree_cb('create') },
    { key = 'd',           cb = tree_cb('remove') },
    { key = 'r',           cb = tree_cb('rename') },
    { key = 'x',           cb = tree_cb('cut') },
    -- { key = 'c',           cb = tree_cb('copy') },
    { key = 'p',           cb = tree_cb('paste') },
    { key = 'q',           cb = tree_cb('close') },
    { key = '?',           cb = tree_cb('toggle_help') }
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

-- Keymaps
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
