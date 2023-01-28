-- General keymaps
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { silent = true, desc = "Unhighlight search results" })
vim.keymap.set("i", "jj", "<Esc>", { silent = true, desc = "Exit INSERT mode" })

-- Move line down
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { silent = true, desc = "Move line down" })
vim.keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { silent = true, desc = "Move line down" })

-- Move line up
vim.keymap.set("i", "<A-k>", "<ESC><cmd>m .-2<CR>==gi", { silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { silent = true, desc = "Move line up" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { silent = true, desc = "Move line up" })

-- Indent line right
vim.keymap.set("i", "<A-l>", "<Esc>>>gi", { silent = true, desc = "Indent line right" })
vim.keymap.set("v", "<A-l>", ">gv", { silent = true, desc = "Indent line right" })
vim.keymap.set("n", "<A-l>", ">>", { silent = true, desc = "Indent line right" })

-- Indent line left
vim.keymap.set("i", "<A-h>", "<Esc><<gi", { silent = true, desc = "Indent line left" })
vim.keymap.set("v", "<A-h>", "<gv", { silent = true, desc = "Indent line left" })
vim.keymap.set("n", "<A-h>", "<<", { silent = true, desc = "Indent line left" })

-- Navigate split windows
vim.keymap.set("n", "<C-h>", "<C-W>h", { silent = true, desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-W>j", { silent = true, desc = "Go to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-W>k", { silent = true, desc = "Go to top window" })
vim.keymap.set("n", "<C-l>", "<C-W>l", { silent = true, desc = "Go to right window" })

-- Resize vertical splits
vim.keymap.set("n", "<C-w>k", "<cmd>vertical resize +10<CR>", { silent = true, desc = "Increase split size" })
vim.keymap.set("n", "<C-w>j", "<cmd>vertical resize -10<CR>", { silent = true, desc = "Decrease split size" })

-- Delete without copying
vim.keymap.set("v", "D", '"_d', { silent = true, desc = "Delete selection without copying" })
vim.keymap.set("n", "DD", '"_dd', { silent = true, desc = "Delete line without copying" })
