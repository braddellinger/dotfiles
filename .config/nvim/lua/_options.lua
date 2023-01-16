-- General options
vim.opt.statuscolumn = table.concat({
	"%=%{v:relnum?v:relnum:v:lnum}", -- Relative numbers
	" ", -- Padding
	"%s", -- Signs
})
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
vim.opt.foldlevel = 99
vim.opt.laststatus = 2
vim.opt.backup = false
vim.opt.number = true
vim.g.mapleader = " "
-- vim.opt.cmdheight = 0
vim.opt.scrolloff = 3
vim.opt.fcs = "eob: "
vim.opt.wrap = false
vim.opt.mouse = "a"

-- Default indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Filetype indentation
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

-- Set cursor shape on leave
vim.cmd("autocmd VimLeave * set guicursor=a:hor100")
