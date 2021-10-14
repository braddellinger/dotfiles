local colors = vim.g.line_colors

-- Return file icon if applicable
local function icon(bufname)
    local icon = require('nvim-web-devicons').get_icon(
        bufname,
        vim.fn.fnamemodify(bufname, ':e'),
        { default = true }
    )
    if icon then return ' ' .. icon .. ' ' else return ' ' end
end

-- Set highlights based on mode
function set_highlights()
    vim.api.nvim_command('hi TabLine guibg=' .. colors.inactive_tab_background .. ' guifg=' .. colors.inactive.primary)
    vim.api.nvim_command('hi TabLineInactiveBackground guibg=' .. colors.none .. ' guifg=' .. colors.inactive.primary)
    vim.api.nvim_command('hi TabLineInactiveForeground guibg=' .. colors.inactive.primary .. ' guifg=' .. colors.text)

    local mode = vim.api.nvim_get_mode().mode
    if mode == 'n' or mode == 'c' then
        vim.api.nvim_command('hi TabLineBackground guibg=' .. colors.none .. ' guifg=' .. colors.normal.primary)
        vim.api.nvim_command('hi TabLineForeground guibg=' .. colors.normal.primary .. ' guifg=' .. colors.text)
    elseif mode == 'v' or mode == 'V' or mode == '^V' then
        vim.api.nvim_command('hi TabLineBackground guibg=' .. colors.none .. ' guifg=' .. colors.visual.primary)
        vim.api.nvim_command('hi TabLineForeground guibg=' .. colors.visual.primary .. ' guifg=' .. colors.text)
    elseif mode == 'i' then
        vim.api.nvim_command('hi TabLineBackground guibg=' .. colors.none .. ' guifg=' .. colors.insert.primary)
        vim.api.nvim_command('hi TabLineForeground guibg=' .. colors.insert.primary .. ' guifg=' .. colors.text)
    elseif mode == 'R' or mode == 'Rv' then
        vim.api.nvim_command('hi TabLineBackground guibg=' .. colors.none .. ' guifg=' .. colors.replace.primary)
        vim.api.nvim_command('hi TabLineForeground guibg=' .. colors.replace.primary .. ' guifg=' .. colors.text)
    end
end

-- Construct tabline
function tabline()
    set_highlights()
    local tl = { '%#Tabline#' }
    local tabcount = vim.fn.tabpagenr('$')
    for t = 1, tabcount do
        local buflist = vim.fn.tabpagebuflist(t)

        -- Tab name displays all buffers within it.
        -- Check buftype to ignore temp buffers like floating windows.
        local bufs = ''
        for i, bufnr in ipairs(buflist) do
            local bufname = vim.fn.bufname(bufnr)
            if bufname == '' and vim.api.nvim_buf_get_option(bufnr, 'buftype') == '' then bufname = '[No Name]' end
            local shortname = vim.fn.fnamemodify(bufname, ':t')

            local bufmodified = (vim.fn.getbufvar(bufnr, '&mod') == 1 and '  ' or '')

            if i == 1 then
                bufs = bufs .. icon(bufname) .. shortname .. bufmodified
            else
                if bufname ~= '' then bufs = bufs .. '  | ' .. icon(bufname) .. shortname .. bufmodified end
            end
        end

        if t == vim.fn.tabpagenr() then
            table.insert(tl, ' %#TabLineBackground# ' .. bufs .. '  ')
            table.insert(tl, '%#TabLine# ')

        else
            table.insert(tl, '%#TabLine#  ' .. bufs .. '   ')
            table.insert(tl, '%#TabLine#')
        end
    end

    table.insert(tl, '%#Tabline#')
    return table.concat(tl)
end

vim.o.tabline = [[%!v:lua.tabline()]]
