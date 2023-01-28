-- Filetype indentation
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

-- Set cursor shape on leave
vim.api.nvim_create_autocmd("VimLeave", {
	pattern = { "*" },
	callback = function()
		vim.opt.guicursor = "a:hor100"
	end,
})
