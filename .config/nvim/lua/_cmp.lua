local cmp = require('cmp')

local icons = {
    Text = ' ',
    Method = ' ',
    Function = ' ',
    Constructor = ' ',
    Field = 'ﰠ ',
    Variable = ' ',
    Class = 'ﴯ ',
    Interface = ' ',
    Module = ' ',
    Property = 'ﰠ ',
    Unit = '塞 ',
    Value = ' ',
    Enum = ' ',
    Keyword = ' ',
    Snippet = ' ',
    Color = ' ',
    File = ' ',
    Reference = ' ',
    Folder = ' ',
    EnumMember = ' ',
    Constant = ' ',
    Struct = 'פּ ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ''
}

cmp.setup {
    mapping = {
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'calc' }
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(_, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = icons[vim_item.kind]
            return vim_item
        end
    },
}
