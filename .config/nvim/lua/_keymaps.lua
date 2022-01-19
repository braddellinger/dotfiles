-- General keymaps
vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true }) -- unhighlight search results
vim.keymap.set('n', '<leader>j', ':%!python -m json.tool<CR>', { silent = true }) -- format json
vim.keymap.set('i', 'jj', '<Esc>', { silent = true }) -- exit insert mode

-- Move line down
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { silent = true })
vim.keymap.set('v', '<A-j>', ':m \'>+1<CR>gv=gv', { silent = true })
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { silent = true })

-- Move line up
vim.keymap.set('i', '<A-k>', '<ESC>:m .-2<CR>==gi', { silent = true })
vim.keymap.set('v', '<A-k>', ':m \'<-2<CR>gv=gv', { silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { silent = true })

-- Indent line right
vim.keymap.set('i', '<A-l>', '<Esc>>>gi', { silent = true })
vim.keymap.set('v', '<A-l>', '>gv', { silent = true })
vim.keymap.set('n', '<A-l>', '>>', { silent = true })

-- Indent line left
vim.keymap.set('i', '<A-h>', '<Esc><<gi', { silent = true })
vim.keymap.set('v', '<A-h>', '<gv', { silent = true })
vim.keymap.set('n', '<A-h>', '<<', { silent = true })

-- Navigate split windows
vim.keymap.set('n', '<C-h>', '<C-W>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-W>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { silent = true })

-- Resize vertical splits
vim.keymap.set('n', '<C-w>k', ':vertical resize +10<CR>', { silent = true })
vim.keymap.set('n', '<C-w>j', ':vertical resize -10<CR>', { silent = true })
