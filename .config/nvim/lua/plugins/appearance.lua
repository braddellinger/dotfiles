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
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				untracked = { text = "" },
				topdelete = { text = "‾" },
				changedelete = { text = "┃" },
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
	{ "kyazdani42/nvim-web-devicons" },
	{
		"dstein64/nvim-scrollview",
		event = "BufReadPre",
		opts = { current_only = true },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
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
		"sam4llis/nvim-tundra",
		priority = 1000,
		lazy = false,
		config = function()
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
