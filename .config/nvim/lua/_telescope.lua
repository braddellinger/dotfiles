-- Telescope setup
local trouble = require('trouble.providers.telescope')
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        file_ignore_patterns = { 'node_modules', 'vendor', '.git' },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        set_env = { ['COLORTERM'] = 'truecolor' },
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        selection_strategy = 'reset',
        -- prompt_position = 'bottom',
        initial_mode = 'insert',
        color_devicons = true,
        prompt_prefix = '  ',
        -- layout_defaults = {},
        -- preview_cutoff = 120,
        -- results_width = 0.8,
        shorten_path = true,
        -- results_height = 1,
        use_less = true,
        winblend = 0,
        -- width = 0.75,
        border = {},
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        layout_config = {
            horizontal = { mirror = false },
            vertical = { mirror = false }
        },
        mappings = {
            i = {
                ['<Esc>'] = actions.close,      
                ['<C-v>'] = actions.select_vertical,
                ['<C-s>'] = actions.select_horizontal,
                ['<C-t>'] = actions.select_tab,
                ['<CR>'] = actions.select_default + actions.center,
                ['<A-t>'] = trouble.open_with_trouble
            },
            n = {
                ['<Esc>'] = actions.close,      
                ['<C-v>'] = actions.select_vertical,
                ['<C-s>'] = actions.select_horizontal,
                ['<C-t>'] = actions.select_tab,
                ['<CR>'] = actions.select_default + actions.center,
                ['<A-t>'] = trouble.open_with_trouble
            }
        }
    }
}

-- Keymaps
vim.api.nvim_set_keymap('n', '<leader>c', ':Telescope git_commits<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope treesitter<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':Telescope registers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':Telescope quickfix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
