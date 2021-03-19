-- tree settings
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_bindings = {
    ['<CR>'] =   ":lua require'nvim-tree'.on_keypress('edit')<CR>",
    ['o'] =      ":lua require'nvim-tree'.on_keypress('edit')<CR>",
    ['<C-v>'] =  ":lua require'nvim-tree'.on_keypress('vsplit')<CR>",
    ['<C-s>'] =  ":lua require'nvim-tree'.on_keypress('split')<CR>",
    ['<C-t>'] =  ":lua require'nvim-tree'.on_keypress('tabnew')<CR>",
    ['<S-CR>'] = ":lua require'nvim-tree'.on_keypress('close_node')<CR>",
    ['<BS>'] =   ":lua require'nvim-tree'.on_keypress('close_node')<CR>",
    ['<R>'] =    ":lua require'nvim-tree'.on_keypress('refresh')<CR>",
    ['c'] =      ":lua require'nvim-tree'.on_keypress('create')<CR>",
    ['d'] =      ":lua require'nvim-tree'.on_keypress('remove')<CR>",
    ['r'] =      ":lua require'nvim-tree'.on_keypress('rename')<CR>",
    ['x'] =      ":lua require'nvim-tree'.on_keypress('cut')<CR>",
    ['y'] =      ":lua require'nvim-tree'.on_keypress('copy')<CR>",
    ['p'] =      ":lua require'nvim-tree'.on_keypress('paste')<CR>",
    ['q'] =      ":lua require'nvim-tree'.on_keypress('close')<CR>"
}
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = '',
        staged = '✓',
        unmerged = '',
        renamed = '➜',
        untracked = ''
    },
    folder = {
        default = '',
        open = '',
        symlink = '',
    }
}
