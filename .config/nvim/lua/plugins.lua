return require("packer").startup({
	function(use)
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("_treesitter")
			end,
		})
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					run = "make",
					config = function()
						require("telescope").load_extension("fzf")
					end,
				},
				"nvim-lua/plenary.nvim",
				"folke/trouble.nvim",
			},
			config = function()
				require("_telescope")
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("_gitsigns")
			end,
		})
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("_lsp")
			end,
		})
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-calc",
			},
			config = function()
				require("_cmp")
			end,
		})
		-- use({
		-- 	"folke/noice.nvim",
		-- 	event = "VimEnter",
		-- 	config = function()
		-- 		require("_noice")
		-- 	end,
		-- 	requires = {
		-- 		"MunifTanjim/nui.nvim",
		-- 		"rcarriga/nvim-notify",
		-- 		"hrsh7th/nvim-cmp",
		-- 	},
		-- })
		use({
			"folke/trouble.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("_trouble")
			end,
		})
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use({
			"dstein64/nvim-scrollview",
			config = function()
				vim.api.nvim_set_var("scrollview_current_only", true)
			end,
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("_indentline")
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("_tree")
			end,
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("_null")
			end,
		})
		use({
			"sindrets/diffview.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				vim.keymap.set("n", "<leader>d", ":DiffviewOpen<CR>", { silent = true })
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
				vim.cmd("autocmd BufReadPost *.conf setl ft=conf")
			end,
		})
		use({ "christoomey/vim-tmux-navigator" })
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "wbthomason/packer.nvim" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "nvim-lua/popup.nvim" })
		use({
			-- Fixes bug: https://github.com/neovim/neovim/issues/12587
			"antoinemadec/FixCursorHold.nvim",
			config = function()
				vim.g.cursorhold_updatetime = 100
			end,
		})
		-- use({
		-- 	"VonHeikemen/searchbox.nvim",
		-- 	config = function()
		-- 		require("_searchbox")
		-- 	end,
		-- 	requires = { "MunifTanjim/nui.nvim" },
		-- })
		-- use({
		-- 	"folke/zen-mode.nvim",
		-- 	config = function()
		-- 		require("_zen")
		-- 	end,
		-- })
		-- use({
		-- 	"ellisonleao/glow.nvim",
		-- 	config = function()
		-- 		vim.g.glow_border = "rounded"
		-- 		vim.g.glow_style = "~/.config/glow/draculaStyle.json"
		-- 	end,
		-- })

		-- Fun useless plugins
		----------------------------------------
		-- use({
		-- 	"tamton-aquib/duck.nvim",
		-- 	config = function()
		-- 		vim.keymap.set("n", "<leader>dd", function()
		-- 			require("duck").hatch()
		-- 		end, {})
		-- 		vim.keymap.set("n", "<leader>dk", function()
		-- 			require("duck").cook()
		-- 		end, {})
		-- 	end,
		-- })
		-- use({
		-- 	"eandrju/cellular-automaton.nvim",
		-- 	config = function()
		-- 		vim.keymap.set("n", "<leader>q", function()
		-- 			vim.cmd("CellularAutomaton make_it_rain")
		-- 		end, {})
		-- 	end,
		-- })

		-- Colorschemes
		----------------------------------------
		-- use { 'eddyekofo94/gruvbox-flat.nvim', config = function() vim.cmd('colorscheme gruvbox-flat') end }
		-- use { 'bluz71/vim-nightfly-guicolors', config = function() vim.cmd('colorscheme nightfly') end }
		-- use { 'projekt0n/github-nvim-theme', config = function() require('github-theme').setup() end }
		-- use { 'tiagovla/tokyodark.nvim', config = function() vim.cmd('colorscheme tokyodark') end }
		-- use { 'bluz71/vim-moonfly-colors', config = function() vim.cmd('colorscheme moonfly') end }
		-- use { 'tomasiser/vim-code-dark', config = function() vim.cmd('colorscheme code-dark') end }
		-- use { 'folke/tokyonight.nvim', config = function() vim.cmd('colorscheme tokyonight') end }
		-- use { 'sainnhe/everforest', config = function() vim.cmd('colorscheme everforest') end }
		-- use { 'ntk148v/vim-horizon', config = function() vim.cmd('colorscheme horizon') end }
		-- use { 'navarasu/onedark.nvim', config = function() require('onedark').setup() end }
		-- use {
		--     'EdenEast/nightfox.nvim',
		--     config = function()
		--         require('nightfox').setup {
		--             fox = 'nordfox', -- nightfox, nordfox, palefox
		--             styles = { comments = 'italic' },
		--         }
		--         require('nightfox').load()
		--     end
		-- }
		-- use {
		--     'marko-cerovac/material.nvim',
		--     config = function()
		--         vim.g.material_style = 'deep ocean' -- darker, lighter, oceanic, palenight, deep ocean
		--         vim.g.material_italic_comments = true
		--         vim.g.material_borders = true
		--         require('material').set()
		--     end
		-- }
		-- use {
		--     'shaunsingh/moonlight.nvim',
		--     config = function()
		--         vim.g.moonlight_italic_comments = true
		--         vim.g.moonlight_borders = true
		--         require('moonlight').set()
		--     end
		-- }
		-- use {
		--     'challenger-deep-theme/vim',
		--     config = function() vim.cmd('colorscheme challenger-deep') end,
		--     as = 'challenger-deep'
		-- }
		-- use({
		-- 	"rmehri01/onenord.nvim",
		-- 	config = function()
		-- 		require("onenord").setup()
		-- 	end,
		-- })
		-- use({
		-- 	"catppuccin/nvim",
		-- 	as = "catppuccin",
		-- 	config = function()
		-- 		vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
		-- 		require("catppuccin").setup()
		-- 		vim.cmd("colorscheme catppuccin")
		-- 	end,
		-- })
		use({
			"sam4llis/nvim-tundra",
			config = function()
				vim.opt.background = "dark"
				vim.cmd("colorscheme tundra")
			end,
		})
		-- use({
		-- 	"rose-pine/neovim",
		-- 	as = "rose-pine",
		-- 	config = function()
		-- 		require("rose-pine").setup({ dark_variant = "moon" })
		-- 		vim.cmd("colorscheme rose-pine")
		-- 	end,
		-- })
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = vim.g.border })
			end,
		},
	},
})
