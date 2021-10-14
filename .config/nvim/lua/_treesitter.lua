vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            scope_incremental = 'grc',
            node_incremental = 'grn',
            node_decremental = 'grm',
            init_selection = 'gnn'
        }
    }
}
