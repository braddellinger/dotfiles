vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>lua require("searchbox").replace({ clear_matches = true, confirm = "menu" })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>s', '<Esc><cmd>lua require("searchbox").replace({ visual_mode = true, clear_matches = true, confirm = "menu" })<CR>', { noremap = true, silent = true })
