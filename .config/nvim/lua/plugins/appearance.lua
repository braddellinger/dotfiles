return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost",
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = "all",
		},
		config = function(plugin, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				changedelete = { text = "│" },
				topdelete = { text = "‾" },
				untracked = { text = "" },
				change = { text = "│" },
				delete = { text = "_" },
				add = { text = "│" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })
				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })
				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
				map("n", "<leader>hS", gs.stage_buffer)
				map("n", "<leader>hu", gs.undo_stage_hunk)
				map("n", "<leader>hR", gs.reset_buffer)
				map("n", "<leader>hp", gs.preview_hunk)
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)
				map("n", "<leader>tb", gs.toggle_current_line_blame)
				map("n", "<leader>hd", gs.diffthis)
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end)
				map("n", "<leader>td", gs.toggle_deleted)
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	{
		"dstein64/nvim-scrollview",
		event = "BufReadPre",
		opts = { current_only = true },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		enabled = false,
		opts = {
			filetype_exclude = {
				"checkhealth",
				"NvimTree",
				"Trouble",
				"lspinfo",
				"lazy",
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
			char = "",
		},
	},
	{
		"echasnovski/mini.indentscope",
		event = "BufReadPre",
		opts = {
			options = { try_as_border = true },
			symbol = "│",
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "NvimTree", "Trouble", "lazy" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				long_message_to_split = true,
				command_palette = true,
				bottom_search = false,
			},
		},
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			{
				"rcarriga/nvim-notify",
				opts = { timeout = 100 },
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				component_separators = { left = "   ", right = "  " },
				section_separators = { left = "", right = " " },
				disabled_filetypes = { statusline = { "NvimTree", "lazy" } },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "filename", filetype_names = { TelescopePrompt = "Telescope" }, symbols = { modified = " " } },
				},
				lualine_b = { "" },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " " .. vim.g.diagnosticsigns.Error .. " ",
							warn = " " .. vim.g.diagnosticsigns.Warn .. " ",
							info = " " .. vim.g.diagnosticsigns.Info .. " ",
							hint = " " .. vim.g.diagnosticsigns.Hint .. " ",
						},
					},
				},
				lualine_x = { { "filetype", icon_only = true } },
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		},
		dependencies = { { "kyazdani42/nvim-web-devicons" } },
	},
	{
		"sam4llis/nvim-tundra",
		priority = 1000,
		config = function()
			require("nvim-tundra").setup({})
			vim.cmd([[colorscheme tundra]])
		end,
	},
}

-- Other plugins
----------------------------------------
-- VonHeikemen/searchbox.nvim
-- ellisonleao/glow.nvim
-- folke/zen-mode.nvim
-- folke/noice.nvim

-- Colorschemes
----------------------------------------
-- eddyekofo94/gruvbox-flat.nvim
-- bluz71/vim-nightfly-guicolors
-- marko-cerovac/material.nvim
-- projekt0n/github-nvim-theme
-- shaunsingh/moonlight.nvim
-- bluz71/vim-moonfly-colors
-- challenger-deep-theme/vim
-- tomasiser/vim-code-dark
-- tiagovla/tokyodark.nvim
-- EdenEast/nightfox.nvim
-- navarasu/onedark.nvim
-- folke/tokyonight.nvim
-- rmehri01/onenord.nvim
-- sam4llis/nvim-tundra
-- ntk148v/vim-horizon
-- sainnhe/everforest
-- rose-pine/neovim
-- catppuccin/nvim
