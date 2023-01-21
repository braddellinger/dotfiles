-- General keymaps
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { silent = true }) -- Unhighlight search results
vim.keymap.set("n", "<leader>j", "<cmd>%!python -m json.tool<CR>", { silent = true }) -- Format json
vim.keymap.set("i", "jj", "<Esc>", { silent = true }) -- Exit insert mode

-- Move line down
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { silent = true })
vim.keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { silent = true })

-- Move line up
vim.keymap.set("i", "<A-k>", "<ESC><cmd>m .-2<CR>==gi", { silent = true })
vim.keymap.set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { silent = true })

-- Indent line right
vim.keymap.set("i", "<A-l>", "<Esc>>>gi", { silent = true })
vim.keymap.set("v", "<A-l>", ">gv", { silent = true })
vim.keymap.set("n", "<A-l>", ">>", { silent = true })

-- Indent line left
vim.keymap.set("i", "<A-h>", "<Esc><<gi", { silent = true })
vim.keymap.set("v", "<A-h>", "<gv", { silent = true })
vim.keymap.set("n", "<A-h>", "<<", { silent = true })

-- Navigate split windows
vim.keymap.set("n", "<C-h>", "<C-W>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-W>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-W>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-W>l", { silent = true })

-- Resize vertical splits
vim.keymap.set("n", "<C-w>k", "<cmd>vertical resize +10<CR>", { silent = true })
vim.keymap.set("n", "<C-w>j", "<cmd>vertical resize -10<CR>", { silent = true })

-- Delete without copying
vim.keymap.set("n", "D", '"_d', { silent = true })
vim.keymap.set("v", "D", '"_d', { silent = true })
