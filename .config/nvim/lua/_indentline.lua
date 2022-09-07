require("indent_blankline").setup({
	filetype_exclude = {
		"checkhealth",
		"NvimTree",
		"startify",
		"Trouble",
		"lspinfo",
		"packer",
		"help",
		"man",
		"",
	},
	buftype_exclude = {
		"terminal",
		"nofile",
		"quickfix",
	},
	show_first_indent_level = false,
	show_current_context = true,
	use_treesitter = true,
	context_char = "│",
	enabled = true,
	char = "",
})
