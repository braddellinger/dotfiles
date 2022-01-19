require('indent_blankline').setup {
    -- context_patterns = {
    --     'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for',
    --     '^object', '^table', 'block', 'arguments', 'if_statement', 'else_clause',
    --     'jsx_element', 'jsx_self_closing_element', 'try_statement',
    --     'catch_clause', 'import_statement', 'operation_type'
    -- },
    filetype_exclude = { 'help', 'NvimTree', 'startify', 'packer', 'Trouble' },
    buftype_exclude = { 'terminal' },
    show_first_indent_level = false,
    show_current_context = true,
    use_treesitter = true,
    context_char = '│',
    enabled = true,
    char = ''
}
