require("noice").setup({
	messages = {
		view_search = "virtualtext",
		view_history = "messages",
		view_error = "notify",
		view_warn = "notify",
		view = "notify",
		enabled = true,
	},
	presets = {
		long_message_to_split = true,
		command_palette = true,
		lsp_doc_border = false,
		bottom_search = false,
		inc_rename = false,
	},
})
