local trouble = require('trouble.providers.telescope')
local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        file_ignore_patterns = { 'node_modules', 'vendor' },
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        initial_mode = 'insert',
        color_devicons = true,
        prompt_prefix = '  ',
        selection_caret = '  ',
        entry_prefix = '  ',
        multi_icon = ' ',
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
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

vim.keymap.set('n', '<leader>c', ':Telescope git_commits<CR>', { silent = true })
vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<leader>t', ':Telescope treesitter<CR>', { silent = true })
vim.keymap.set('n', '<leader>r', ':Telescope registers<CR>', { silent = true })
vim.keymap.set('n', '<leader>g', ':Telescope live_grep<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':Telescope quickfix<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { silent = true })
