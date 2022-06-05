-- Run :PackerCompile whenever plugins.lua is updated
vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")

return require("packer").startup({
	function()
		use({
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("_treesitter")
			end,
			event = "BufRead",
			run = ":TSUpdate",
			opt = true,
		})
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("_telescope")
			end,
			wants = { "plenary.nvim", "popup.nvim" },
			requires = {
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					config = function()
						require("telescope").load_extension("fzf")
					end,
					run = "make",
				},
				"nvim-lua/plenary.nvim",
				"nvim-lua/popup.nvim",
				"trouble.nvim",
			},
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("_gitsigns")
			end,
			requires = { "nvim-lua/plenary.nvim" },
			event = "BufReadPre",
		})
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("_lsp")
			end,
			event = "BufReadPre",
			opt = true,
		})
		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("_cmp")
			end,
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-calc",
			},
		})
		use({
			"VonHeikemen/searchbox.nvim",
			config = function()
				require("_searchbox")
			end,
			requires = { "MunifTanjim/nui.nvim" },
		})
		use({
			"folke/trouble.nvim",
			config = function()
				require("_trouble")
			end,
			wants = "nvim-web-devicons",
		})
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use({
			"folke/zen-mode.nvim",
			config = function()
				require("_zen")
			end,
		})
		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({ default = true })
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
			config = function()
				require("_tree")
			end,
			requires = "nvim-web-devicons",
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("_null")
			end,
			requires = { "nvim-lua/plenary.nvim" },
		})
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
		use({ "christoomey/vim-tmux-navigator" })
		use({ "wbthomason/packer.nvim" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "nvim-lua/popup.nvim" })

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
		-- use {
		--     'catppuccin/nvim',
		--     config = function() require('catppuccin').load() end,
		--     as = 'catppuccin'
		-- }
		use({
			"rmehri01/onenord.nvim",
			config = function()
				require("onenord").setup()
			end,
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = vim.g.border })
			end,
		},
	},
})
