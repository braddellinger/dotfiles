-- kommentary settings
require('kommentary.config').configure_language('default', {
    prefer_single_line_comments = true,
})

-- keymaps
vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap('n', 'gc', '<Plug>kommentary_line_default', {})
vim.api.nvim_set_keymap('n', 'gc', '<Plug>kommentary_motion_default', {})
vim.api.nvim_set_keymap('v', 'gc', '<Plug>kommentary_visual_default', {})
