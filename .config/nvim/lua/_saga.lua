local saga = require 'lspsaga'.init_lsp_saga()

vim.api.nvim_set_keymap('n', 'gH', ':Lspsaga hover_doc<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gF', ':Lspsaga lsp_finder<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', 'ca', ':Lspsaga range_code_action<CR>', { noremap = true })
