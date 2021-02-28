-- treesitter settings
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldmethod = 'expr'

-- treesitter setup
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    }
}
