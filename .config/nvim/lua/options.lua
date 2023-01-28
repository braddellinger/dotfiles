-- General options
vim.opt.statuscolumn = table.concat({
	"%=%{v:relnum?v:relnum:v:lnum}", -- Relative numbers
	" ", -- Padding
	"%s", -- Signs
})
vim.g.diagnosticsigns = {
	Error = "",
	Warn = "",
	Info = "",
	Hint = "",
}
vim.opt.fillchars = { diff = " " }
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.updatetime = 100
vim.g.border = "rounded"
vim.opt.showtabline = 2
vim.opt.laststatus = 2
vim.opt.foldlevel = 99
vim.opt.backup = false
vim.opt.number = true
vim.g.mapleader = " "
vim.opt.cmdheight = 0
vim.opt.scrolloff = 3
vim.opt.fcs = "eob: "
vim.opt.wrap = false
vim.opt.mouse = "a"

-- Default indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
