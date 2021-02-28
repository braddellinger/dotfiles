-- compe setup
require'compe'.setup {
    incomplete_delay = 400;
    source_timeout = 200;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    preselect = 'enable';
    autocomplete = true;
    throttle_time = 80;
    enabled = true;
    min_length = 1;
    debug = false;
    source = {
        snippets_nvim = true;
        treesitter = true;
        nvim_lsp = true;
        nvim_lua = true;
        buffer = true;
        spell = true;
        vsnip = true;
        calc = true;
        path = true;
        tags = true;
    };
}

-- tab completion helper
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- tab completion
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    else
        return t '<Tab>'
    end
end

-- shift + tab completion
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    else
        return t '<S-Tab>'
    end
end

-- tab keymaps
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { noremap = true, silent = true, expr = true })

-- shift + tab keymaps
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { noremap = true, silent = true, expr = true })

-- other keymaps
vim.api.nvim_set_keymap('i', '<C-f>', 'compe#scroll({ delta = +4 })', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({ delta = -4 })', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm(\'<CR>\')', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close(\'<C-e>\')', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, silent = true, expr = true })
