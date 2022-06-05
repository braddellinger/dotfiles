-- Map keys to highlight groups
local colors = {
	background = "%#StatusLineBackground#",
	foreground = "%#StatusLineForeground#",
	inactive_background = "%#StatusLineInactiveBackground#",
	inactive_foreground = "%#StatusLineInactiveForeground#",
	no_content = "%#StatusLineNC#",
}

-- Set colors based on mode
local function set_colors()
	vim.api.nvim_command("hi StatusLine guibg=none guifg=none")
	vim.api.nvim_command("hi StatusLineNC guibg=none guifg=none")
	vim.api.nvim_command("hi StatusLineInactiveBackground guibg=none guifg=#5C6370")
	vim.api.nvim_command("hi StatusLineInactiveForeground guibg=#5C6370 guifg=black")

	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" or mode == "c" then
		vim.api.nvim_command("hi StatusLineBackground guibg=none guifg=#62d196")
		vim.api.nvim_command("hi StatusLineForeground guibg=#62d196 guifg=black")
	elseif mode == "v" or mode == "V" or mode == "^V" then
		vim.api.nvim_command("hi StatusLineBackground guibg=none guifg=#65b2ff")
		vim.api.nvim_command("hi StatusLineForeground guibg=#65b2ff guifg=black")
	elseif mode == "i" then
		vim.api.nvim_command("hi StatusLineBackground guibg=none guifg=#ff8080")
		vim.api.nvim_command("hi StatusLineForeground guibg=#ff8080 guifg=black")
	elseif mode == "R" or mode == "Rv" then
		vim.api.nvim_command("hi StatusLineBackground guibg=none guifg=#E5C07B")
		vim.api.nvim_command("hi StatusLineForeground guibg=#E5C07B guifg=black")
	end
end

-- Return file icon if applicable
local function icon()
	local icon = require("nvim-web-devicons").get_icon(vim.fn.expand("%:t"), vim.fn.expand("%:e"), { default = true })
	if icon then
		return " " .. icon .. " "
	else
		return " "
	end
end

-- Return modified symbol if file has unsaved changes
local function modified()
	if vim.bo.modified then
		return "  "
	else
		return ""
	end
end

-- Return lsp diagnostics
local function lsp_diagnostics()
	local display = ""
	if #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }) > 0 then
		display = display .. "%#DiagnosticError#  "
	end
	if #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }) > 0 then
		display = display .. "%#DiagnosticWarn#  "
	end
	if #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }) > 0 then
		display = display .. "%#DiagnosticInfo#  "
	end
	if #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }) > 0 then
		display = display .. "%#DiagnosticHint#  "
	end
	return display
end

-- Construct active statusline
local function active()
	local lsp_diagnostics = colors.background .. lsp_diagnostics()
	local right_separator = colors.background .. " "
	local left_separator = colors.background .. " "
	local modified = colors.foreground .. modified()
	local position = colors.foreground .. " %l:%c "
	local filename = colors.foreground .. "%t "
	local icon = colors.foreground .. icon()
	local no_content = colors.no_content
	local spacer = "%="

	return table.concat({
		left_separator,
		icon,
		filename,
		modified,
		right_separator,
		lsp_diagnostics,
		spacer,
		left_separator,
		position,
		right_separator,
		no_content,
	})
end

-- Construct inactive statusline
local function inactive()
	local right_separator = colors.inactive_background .. " "
	local left_separator = colors.inactive_background .. " "
	local filename = colors.inactive_foreground .. "%t "
	local icon = colors.inactive_foreground .. icon()

	return table.concat({
		left_separator,
		icon,
		filename,
		right_separator,
	})
end

-- Construct tree statusline
local function tree()
	local no_content = colors.no_content
	return no_content
end

-- Set statusline colors and return statusline based on status
function statusline(status)
	set_colors()
	if status == "active" then
		return active()
	end
	if status == "inactive" then
		return inactive()
	end
	if status == "tree" then
		return tree()
	end
end

vim.api.nvim_exec(
	[[
    augroup statusline
    autocmd WinEnter,BufEnter * setlocal statusline=%!v:lua.statusline('active')
    autocmd WinLeave,BufLeave * setlocal statusline=%!v:lua.statusline('inactive')
    autocmd WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.statusline('tree')
    autocmd WinLeave,BufLeave,FileType NvimTree setlocal statusline=%!v:lua.statusline('tree')
    augroup end
]],
	false
)
