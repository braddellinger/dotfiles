return {
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
			{ "<leader>c", "<cmd>Telescope git_commits<CR>" },
			{ "<leader>f", "<cmd>Telescope find_files<CR>" },
			{ "<leader>t", "<cmd>Telescope treesitter<CR>" },
			{ "<leader>r", "<cmd>Telescope registers<CR>" },
			{ "<leader>g", "<cmd>Telescope live_grep<CR>" },
			{ "<leader>q", "<cmd>Telescope quickfix<CR>" },
			{ "<leader>b", "<cmd>Telescope buffers<CR>" },
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
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
		},
	},
	{
		"kyazdani42/nvim-tree.lua",
		keys = { { "<leader>e", "<cmd>NvimTreeToggle<CR>" } },
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
}
