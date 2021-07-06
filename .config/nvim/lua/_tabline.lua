-- Set highlights based on mode
function set_tabline_colors()
    vim.api.nvim_command('hi TabLineInactiveBackground guibg=none guifg=#5C6370')
    vim.api.nvim_command('hi TabLineInactiveForeground guibg=#5C6370 guifg=black')

    local m = vim.fn.mode()
    if m == 'n' or m == 'c' then
        vim.api.nvim_command('hi TabLineBackground guibg=none guifg=#98C379')
        vim.api.nvim_command('hi TabLineForeground guibg=#98C379 guifg=black')
    elseif m == 'v' or m == 'V' or m == '^V' then
        vim.api.nvim_command('hi TabLineBackground guibg=none guifg=#61AFEF')
        vim.api.nvim_command('hi TabLineForeground guibg=#61AFEF guifg=black')
    elseif m == 'i' then
        vim.api.nvim_command('hi TabLineBackground guibg=none guifg=#E06C75')
        vim.api.nvim_command('hi TabLineForeground guibg=#E06C75 guifg=black')
    elseif m == 'R' or m == 'Rv' then
        vim.api.nvim_command('hi TabLineBackground guibg=none guifg=#E5C07B')
        vim.api.nvim_command('hi TabLineForeground guibg=#E5C07B guifg=black')
    end

    return ''
end

-- Construct tabline
function tabline()
    local tl = { '%{v:lua.set_tabline_colors()}', '%#StatusLineNC#  ' } 
    local tabcount = vim.fn.tabpagenr('$')
    for t = 1, tabcount do
        local winnr = vim.fn.tabpagewinnr(t)
        local buflist = vim.fn.tabpagebuflist(t)
        local bufnr = buflist[winnr]
        local bufmodified = ''
        local bufname = vim.fn.bufname(bufnr)

        if vim.fn.getbufvar(bufnr, '&mod') == 1 then bufmodified = ' ' end
        if bufname == '' then bufname = '[No Name]' end

        if t == vim.fn.tabpagenr() then
            table.insert(tl, '%#TabLineBackground#')
            table.insert(tl, '%#TabLineForeground# '..bufname..' ')
            table.insert(tl, '%#TabLineForeground#'..bufmodified)
            table.insert(tl, '%#TabLineBackground#')
        else
            table.insert(tl, '%#TabLineInactiveBackground#')
            table.insert(tl, '%#TabLineInactiveForeground# '..bufname..' ')
            table.insert(tl, '%#TabLineInactiveForeground#'..bufmodified)
            table.insert(tl, '%#TabLineInactiveBackground#')
        end

        if t ~= tabcount then table.insert(tl, '  ') end
    end

    return table.concat(tl)
end

-- Set tabline
vim.o.tabline = [[%!v:lua.tabline()]]
