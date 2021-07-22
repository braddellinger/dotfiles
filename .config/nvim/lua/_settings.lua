-- Colors
vim.cmd('colorscheme tokyonight')
vim.g.tokyonight_style = 'storm' -- storm/night
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.syntax = 'on'

-- Backup & swap
vim.o.backupdir = os.getenv("HOME") .. '/.config/nvim/backup//'
vim.o.directory = os.getenv("HOME") .. '/.config/nvim/swp//'

-- Lines numbers
vim.wo.relativenumber = true 
vim.wo.number = true

-- Other settings
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

-- Indentation
vim.bo.autoindent = true
vim.o.autoindent = true
vim.bo.expandtab = true
vim.o.expandtab = true
vim.bo.shiftwidth = 4
vim.o.shiftwidth = 4
vim.bo.tabstop = 4
vim.o.tabstop = 4

-- Search
vim.o.inccommand = 'nosplit'
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- Set cursor shape on leave
vim.cmd('autocmd VimLeave * set guicursor=a:hor100')

