vim.keymap.set('n', '<leader>s', '<cmd>lua require("searchbox").replace({ clear_matches = true, confirm = "menu" })<CR>', { silent = true })
vim.keymap.set('v', '<leader>s', '<Esc><cmd>lua require("searchbox").replace({ visual_mode = true, clear_matches = true, confirm = "menu" })<CR>', { silent = true })
