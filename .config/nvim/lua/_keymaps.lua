-- General keymaps
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true }) -- unhighlight search results
vim.api.nvim_set_keymap('n', '<leader>j', ':%!python -m json.tool<CR>', { noremap = true, silent = true }) -- format json
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true }) -- exit insert mode

-- Move line down
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })

-- Move line up
vim.api.nvim_set_keymap('i', '<A-k>', '<ESC>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Indent line right
vim.api.nvim_set_keymap('i', '<A-l>', '<Esc>>>gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-l>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '>>', { noremap = true, silent = true })

-- Indent line left
vim.api.nvim_set_keymap('i', '<A-h>', '<Esc><<gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-h>', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', '<<', { noremap = true, silent = true })

-- Navigate split windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true, silent = true })

-- Resize vertical splits
vim.api.nvim_set_keymap('n', '<C-w>k', ':vertical resize +10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>j', ':vertical resize -10<CR>', { noremap = true, silent = true })
