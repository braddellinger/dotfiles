-- external dependencies
----------------------------------------
-- language servers (https://github.com/neovim/nvim-lspconfig)
-- packer (https://github.com/wbthomason/packer.nvim)
-- neovim >=0.5 (https://github.com/neovim/neovim)
-- rg (https://github.com/BurntSushi/ripgrep)
-- nerdfont (https://www.nerdfonts.com/)
-- nodejs (https://nodejs.org/en/)


-- run :PackerCompile whenever plugins.lua is updated
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

-- required if packer is installed in `opt` pack
vim.cmd [[packadd packer.nvim]]

-- install plugins
return require('packer').startup(function()
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'challenger-deep-theme/vim', as = 'challenger-deep' }
    use { 'dstein64/nvim-scrollview', branch = 'main' }
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'drewtempelmeyer/palenight.vim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'NLKNguyen/papercolor-theme' }
    use { 'gruvbox-community/gruvbox' }
    use { 'kyazdani42/nvim-tree.lua' }
    use { 'mhartington/oceanic-next' }
    use { 'arcticicestudio/nord-vim' }
    use { 'tomasiser/vim-code-dark' }
    use { 'airblade/vim-gitgutter' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'neovim/nvim-lspconfig' }
    use { 'joshdick/onedark.vim' }
    use { 'sainnhe/forest-night' }
    use { 'onsails/lspkind-nvim' }
    use { 'ntk148v/vim-horizon' }
    use { 'nvim-lua/popup.nvim' }
    use { 'hrsh7th/nvim-compe' }
    use { 'tpope/vim-fugitive' }
    use { 'mhinz/vim-startify' }
    use { 'ayu-theme/ayu-vim' }
end)
