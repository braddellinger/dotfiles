vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', { silent = true })

require('zen-mode').setup {
    window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
            relativenumber = false,
            signcolumn = 'no',
            number = false
        }
    },
    plugins = {
        options = {
            showcmd = false,
            enabled = true,
            ruler = false
        },
        gitsigns = { enabled = false },
        twilight = { enabled = true },
        tmux = { enabled = false },
        kitty = {
            enabled = false,
            font = '+4'
        }
    },
    on_open = function(win) vim.cmd('ScrollViewDisable') end,
    on_close = function() vim.cmd('ScrollViewEnable') end
}
