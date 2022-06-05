local trouble = require("trouble.providers.telescope")
local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		-- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		file_ignore_patterns = { "node_modules", "vendor" },
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		initial_mode = "insert",
		color_devicons = true,
		prompt_prefix = "     ",
		selection_caret = "  ",
		entry_prefix = "  ",
		multi_icon = " ",
		borderchars = { "" },
		vimgrep_arguments = {
			"rg",
			"--with-filename",
			"--line-number",
			"--color=never",
			"--no-heading",
			"--smart-case",
			"--column",
			"--hidden",
		},
		layout_config = {
			vertical = { mirror = false },
			preview_cutoff = 120,
			height = 0.7,
			width = 0.7,
			horizontal = {
				prompt_position = "top",
				preview_width = 0.7,
				results_width = 0.3,
			},
		},
		mappings = {
			i = {
				["<Esc>"] = actions.close,
				["<C-v>"] = actions.select_vertical,
				["<C-s>"] = actions.select_horizontal,
				["<C-t>"] = actions.select_tab,
				["<CR>"] = actions.select_default + actions.center,
				["<A-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<Esc>"] = actions.close,
				["<C-v>"] = actions.select_vertical,
				["<C-s>"] = actions.select_horizontal,
				["<C-t>"] = actions.select_tab,
				["<CR>"] = actions.select_default + actions.center,
				["<A-t>"] = trouble.open_with_trouble,
			},
		},
	},
})

vim.keymap.set("n", "<leader>c", ":Telescope git_commits<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":Telescope treesitter<CR>", { silent = true })
vim.keymap.set("n", "<leader>r", ":Telescope registers<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":Telescope quickfix<CR>", { silent = true })
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { silent = true })

vim.api.nvim_command("hi TelescopeResultsBorder guibg=#1e222a guifg=#1e222a")
vim.api.nvim_command("hi TelescopePromptBorder guibg=#242932 guifg=#242932")
vim.api.nvim_command("hi TelescopePreviewBorder guibg=#1c1f26 guifg=#1c1f26")
vim.api.nvim_command("hi TelescopePromptNormal  guibg=#242932")
vim.api.nvim_command("hi TelescopeResultsNormal guibg=#1e222a")
vim.api.nvim_command("hi TelescopePreviewNormal guibg=#1c1f26")
vim.api.nvim_command("hi TelescopePromptPrefix guibg=#242932")
vim.api.nvim_command("hi TelescopeResultsTitle guifg=#1e222a")
vim.api.nvim_command("hi TelescopePreviewTitle guifg=#1c1f26")
vim.api.nvim_command("hi TelescopePromptTitle guifg=#242932")
