-- Colors
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.syntax = "on"

-- Backup & swap
vim.o.backupdir = os.getenv("HOME") .. "/.config/nvim/backup//"
vim.o.directory = os.getenv("HOME") .. "/.config/nvim/swp//"

-- Lines numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- Other settings
vim.opt.fillchars = { diff = " " }
vim.o.clipboard = "unnamedplus"
vim.o.writebackup = false
vim.wo.signcolumn = "yes"
vim.o.splitright = true
vim.o.showmode = true
vim.o.wildmenu = true
vim.g.mapleader = " "
vim.o.showcmd = true
vim.o.foldlevel = 99
vim.o.laststatus = 2
vim.o.scrolloff = 3
vim.o.fcs = "eob: "
vim.o.wrap = false
vim.o.mouse = "a"

-- Indentation
vim.bo.autoindent = true
vim.o.autoindent = true
vim.bo.expandtab = true
vim.o.expandtab = true
vim.bo.shiftwidth = 2
vim.o.shiftwidth = 2
vim.bo.tabstop = 2
vim.o.tabstop = 2

-- Search
vim.o.inccommand = "nosplit"
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- Reusable border object
vim.g.border = "rounded"
-- vim.g.border = {
--     { '🭽', 'FloatBorder' },
--     { '▔', 'FloatBorder' },
--     { '🭾', 'FloatBorder' },
--     { '▕', 'FloatBorder' },
--     { '🭿', 'FloatBorder' },
--     { '▁', 'FloatBorder' },
--     { '🭼', 'FloatBorder' },
--     { '▏', 'FloatBorder' }
-- }

-- Set cursor shape on leave
vim.cmd("autocmd VimLeave * set guicursor=a:hor100")
