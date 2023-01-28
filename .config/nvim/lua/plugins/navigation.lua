return {
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
		keys = {
			{ "<leader>c", "<cmd>Telescope git_commits<CR>", desc = "Telescope git commits" },
			{ "<leader>t", "<cmd>Telescope treesitter<CR>", desc = "Telescope treesitter" },
			{ "<leader>r", "<cmd>Telescope registers<CR>", desc = "Telescope registers" },
			{ "<leader>q", "<cmd>Telescope quickfix<CR>", desc = "Telescope quickfix" },
			{ "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Telescope files" },
			{ "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
			{ "<leader>g", "<cmd>Telescope live_grep<CR>", desc = "Telescope grep" },
		},
		opts = {
			defaults = {
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				file_ignore_patterns = { "node_modules", "vendor" },
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				initial_mode = "insert",
				color_devicons = true,
				prompt_prefix = "     ",
				selection_caret = "  ",
				entry_prefix = "  ",
				multi_icon = " ",
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
						["<Esc>"] = function(...)
							return require("telescope.actions").close(...)
						end,
						["<C-v>"] = function(...)
							return require("telescope.actions").select_vertical(...)
						end,
						["<C-s>"] = function(...)
							return require("telescope.actions").select_horizontal(...)
						end,
						["<C-t>"] = function(...)
							return require("telescope.actions").select_tab(...)
						end,
						["<A-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
					},
					n = {
						["<Esc>"] = function(...)
							return require("telescope.actions").close(...)
						end,
						["<C-v>"] = function(...)
							return require("telescope.actions").select_vertical(...)
						end,
						["<C-s>"] = function(...)
							return require("telescope.actions").select_horizontal(...)
						end,
						["<C-t>"] = function(...)
							return require("telescope.actions").select_tab(...)
						end,
						["<A-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
					},
				},
			},
		},
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble document diagnostics" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble workspace diagnostics" },
		},
	},
	{
		"kyazdani42/nvim-tree.lua",
		keys = { { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Open tree" } },
		opts = {
			update_focused_file = { enable = true },
			view = {
				side = "right",
				mappings = {
					list = { { key = "?", action = "toggle_help" } },
					custom_only = false,
				},
			},
			renderer = {
				icons = {
					git_placement = "signcolumn",
					show = {
						folder_arrow = true,
						folder = true,
						file = true,
						git = false,
					},
				},
			},
			diagnostics = {
				show_on_dirs = true,
				enable = true,
				icons = {
					warning = vim.g.diagnosticsigns.Warn,
					error = vim.g.diagnosticsigns.Error,
					hint = vim.g.diagnosticsigns.Hint,
					info = vim.g.diagnosticsigns.Info,
				},
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
			require("which-key").setup({})
		end,
	},
}
