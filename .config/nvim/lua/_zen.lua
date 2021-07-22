-- Keymaps
vim.api.nvim_set_keymap('n', '<leader>z', ':ZenMode<CR>', { noremap = true, silent = true })

-- Settings
require('zen-mode').setup {
    window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
            relativenumber = false,
            signcolumn = "no",
            number = false
        }
    },
    plugins = {
        options = {
            enabled = true,
            ruler = false,
            showcmd = false
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        kitty = {
            enabled = false,
            font = "+4",
        }
    },
    on_open = function(win) vim.cmd('ScrollViewDisable') end,
    on_close = function() vim.cmd('ScrollViewEnable') end
}
