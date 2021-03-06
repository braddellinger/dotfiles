vim.o.laststatus = 2

-- Set highlights based on mode
function set_statusline_colors()
    vim.api.nvim_command('hi StatusLine guibg=none guifg=none')
    vim.api.nvim_command('hi StatusLineNC guibg=none guifg=none')
    vim.api.nvim_command('hi StatusLineInactiveBackground guibg=none guifg=#5C6370')
    vim.api.nvim_command('hi StatusLineInactiveForeground guibg=#5C6370 guifg=black')

    local m = vim.fn.mode()
    if m == 'n' or m == 'c' then
        vim.api.nvim_command('hi StatusLineBackground guibg=none guifg=#98C379')
        vim.api.nvim_command('hi StatusLineForeground guibg=#98C379 guifg=black')
    elseif m == 'v' or m == 'V' or m == '^V' then
        vim.api.nvim_command('hi StatusLineBackground guibg=none guifg=#61AFEF')
        vim.api.nvim_command('hi StatusLineForeground guibg=#61AFEF guifg=black')
    elseif m == 'i' then
        vim.api.nvim_command('hi StatusLineBackground guibg=none guifg=#E06C75')
        vim.api.nvim_command('hi StatusLineForeground guibg=#E06C75 guifg=black')
    elseif m == 'R' or m == 'Rv' then
        vim.api.nvim_command('hi StatusLineBackground guibg=none guifg=#E5C07B')
        vim.api.nvim_command('hi StatusLineForeground guibg=#E5C07B guifg=black')
    end

    return ''
end

-- Get modified status
function modified()
    if vim.bo.modified then return ' ' else return '' end
end

-- Get file icon
function icon()
    local icon = require'nvim-web-devicons'.get_icon(vim.fn.expand("%:t"), vim.bo.filetype)
    if icon then return ' '..icon..' ' else return ' ' end
end

-- Get lsp diagnostics
function diagnostics()
    local display = ' '
    if vim.lsp.diagnostic.get_count(0, 'Error') > 0 then display = display .. '  ' end
    if vim.lsp.diagnostic.get_count(0, 'Warning') > 0 then display = display .. '  ' end
    if vim.lsp.diagnostic.get_count(0, 'Information') > 0 then display = display .. '  ' end
    if vim.lsp.diagnostic.get_count(0, 'Hint') > 0 then display = display .. '  ' end
    return display
end

-- Construct statusline
function statusline(status)
    local sl = {}
    if status == 'active' then
        sl = {
            '%{v:lua.set_statusline_colors()}',
            '%#StatusLine#  ',
            '%#StatusLineBackground#',
            '%#StatusLineForeground#',
            '%{v:lua.icon()}',
            '%#StatusLineForeground#%t ',
            '%{v:lua.modified()}',
            '%#StatusLineBackground#',
            '%{v:lua.diagnostics()}',
            '%=',
            '%#StatusLineBackground#',
            '%#StatusLineForeground# %l:%c ',
            '%#StatusLineBackground#',
            '%#StatusLine#  '
        }
    else
        sl = {
            '%#StatusLine#  ',
            '%#StatusLineInactiveBackground#',
            '%#StatusLineInactiveForeground#',
            '%{v:lua.icon()}',
            '%#StatusLineInactiveForeground#%t ',
            '%{v:lua.modified()}',
            '%#StatusLineInactiveBackground#',
            '%{v:lua.diagnostics()}'
        }
    end

    vim.wo.statusline = table.concat(sl)
end

-- update statusline
statusline('active')
vim.cmd('autocmd WinEnter,BufEnter * call v:lua.statusline("active")')
vim.cmd('autocmd WinLeave,BufLeave * call v:lua.statusline("inactive")')
