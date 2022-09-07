vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

require("nvim-tree").setup({
	view = {
		side = "right",
		mappings = {
			custom_only = false,
			list = {
				{ key = "?", action = "toggle_help" },
			},
		},
	},
	renderer = {
		icons = {
			git_placement = "signcolumn",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},
		},
	},
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
})
