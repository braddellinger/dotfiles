-- colors
vim.cmd('colorscheme challenger_deep')
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.syntax = 'on'

-- backup & swap
vim.o.backupdir = '~/.config/nvim/backup//'
vim.o.directory = '~/.config/nvim/swp//'
-- vim.o.swapfile = false
-- vim.o.backup = false

-- lines numbers
vim.wo.relativenumber = true 
vim.wo.number = true

-- other settings
vim.o.clipboard = 'unnamedplus'
vim.o.writebackup = false
vim.wo.signcolumn = 'yes'
vim.o.splitright = true
vim.o.updatetime = 300
vim.o.showmode = true
vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.foldlevel = 99
vim.o.laststatus = 2
vim.o.scrolloff = 3
vim.o.wrap = false
vim.o.fcs = 'eob: '
vim.o.mouse = 'a'
-- vim.o.foldmethod = 'syntax'
----vim.o.path += **

-- indentation
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- search
vim.o.inccommand = 'nosplit'
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- set cursor shape on leave
vim.cmd('autocmd VimLeave * set guicursor=a:hor100')
