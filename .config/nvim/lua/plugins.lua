-- External dependencies
----------------------------------------
-- Language servers (https://github.com/neovim/nvim-lspconfig)
-- Packer (https://github.com/wbthomason/packer.nvim)
-- Neovim >=0.5 (https://github.com/neovim/neovim)
-- Rg (https://github.com/BurntSushi/ripgrep)
-- Nerdfont (https://www.nerdfonts.com/)
-- NodeJs (https://nodejs.org/en/)


-- Run :PackerCompile whenever plugins.lua is updated
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

-- Required if packer is installed in `opt` pack
vim.cmd('packadd packer.nvim')

-- Use plugins
return require('packer').startup(function()

    -- Functional
    use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'dstein64/nvim-scrollview', branch = 'main' }
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'christoomey/vim-tmux-navigator' }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'kyazdani42/nvim-tree.lua' }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'neovim/nvim-lspconfig' }
    use { 'onsails/lspkind-nvim' }
    use { 'glepnir/lspsaga.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'b3nj5m1n/kommentary' }
    use { 'folke/zen-mode.nvim' }
    use { 'hrsh7th/nvim-compe' }
    use { 'tpope/vim-fugitive' }
    use { 'mhinz/vim-startify' }
    use { 'folke/trouble.nvim' }

    -- Colorschemes
    use { 'challenger-deep-theme/vim', as = 'challenger-deep' }
    use { 'drewtempelmeyer/palenight.vim' }
    use { 'bluz71/vim-nightfly-guicolors' }
    use { 'eddyekofo94/gruvbox-flat.nvim' }
    use { 'NLKNguyen/papercolor-theme' }
    use { 'gruvbox-community/gruvbox' }
    use { 'mhartington/oceanic-next' }
    use { 'arcticicestudio/nord-vim' }
    use { 'tomasiser/vim-code-dark' }
    use { 'tiagovla/tokyodark.nvim' }
    use { 'folke/tokyonight.nvim' }
    use { 'joshdick/onedark.vim' }
    use { 'sainnhe/forest-night' }
    use { 'ntk148v/vim-horizon' }
    use { 'ayu-theme/ayu-vim' }

end)
