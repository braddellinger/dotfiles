-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Non-plugins
require("options")
require("keymaps")

-- Plugins
require("lazy").setup("plugins", {
	change_detection = { notify = false },
	ui = { border = vim.g.border },
})

-- Statusline and tabline
-- require("statuslines/sharp_sectioned")
require("tablines/tabs")
