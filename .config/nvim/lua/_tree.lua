-- tree settings
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_var('nvim_tree_side', 'right')
vim.api.nvim_set_var('nvim_tree_bindings', {
    edit =        { '<CR>', 'o' },
    edit_vsplit = '<C-v>',
    edit_split =  '<C-s>',
    edit_tab =    '<C-t>',
    close_node =  { '<S-CR>', '<BS>' },
    refresh =     'R',
    create =      'c',
    remove =      'd',
    rename =      'r',
    cut =         'x',
    copy =        'y',
    paste =       'p',
    close =       'q' })
vim.api.nvim_set_var('nvim_tree_icons', {
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
    }})
