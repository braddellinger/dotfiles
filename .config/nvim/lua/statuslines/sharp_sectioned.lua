local colors = vim.g.line_colors

-- Map keys to highlight groups
local highlights = {
	primary_background = "%#StatusLinePrimaryBackground#",
	secondary_background = "%#StatusLineSecondaryBackground#",
	primary_foreground = "%#StatusLinePrimaryForeground#",
	secondary_foreground = "%#StatusLineSecondaryForeground#",
	inactive_background = "%#StatusLineInactiveBackground#",
	inactive_foreground = "%#StatusLineInactiveForeground#",
	no_content = "%#StatusLine#",
}

-- Set highlights based on mode
local function set_highlights()
	vim.api.nvim_command("hi StatusLine guibg=" .. colors.none .. " guifg=" .. colors.none)
	-- vim.api.nvim_command("hi StatusLineNC guibg=" .. colors.none .. " guifg=" .. colors.none)
	vim.api.nvim_command(
		"hi StatusLineInactiveBackground guibg=" .. colors.none .. " guifg=" .. colors.inactive.primary
	)
	vim.api.nvim_command(
		"hi StatusLineInactiveForeground guibg=" .. colors.inactive.primary .. " guifg=" .. colors.text
	)
	vim.api.nvim_command(
		"hi StatusLineSecondaryBackground guibg=" .. colors.none .. " guifg=" .. colors.normal.secondary
	)

	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" or mode == "c" then
		vim.api.nvim_command(
			"hi StatusLinePrimaryBackground guibg=" .. colors.none .. " guifg=" .. colors.normal.primary
		)
		vim.api.nvim_command(
			"hi StatusLinePrimaryForeground guibg=" .. colors.normal.primary .. " guifg=" .. colors.text
		)
		vim.api.nvim_command(
			"hi StatusLineSecondaryForeground guibg=" .. colors.normal.secondary .. " guifg=" .. colors.normal.primary
		)
	elseif mode == "v" or mode == "V" or mode == "^V" then
		vim.api.nvim_command(
			"hi StatusLinePrimaryBackground guibg=" .. colors.none .. " guifg=" .. colors.visual.primary
		)
		vim.api.nvim_command(
			"hi StatusLinePrimaryForeground guibg=" .. colors.visual.primary .. " guifg=" .. colors.text
		)
		vim.api.nvim_command(
			"hi StatusLineSecondaryForeground guibg=" .. colors.visual.secondary .. " guifg=" .. colors.visual.primary
		)
	elseif mode == "i" then
		vim.api.nvim_command(
			"hi StatusLinePrimaryBackground guibg=" .. colors.none .. " guifg=" .. colors.insert.primary
		)
		vim.api.nvim_command(
			"hi StatusLinePrimaryForeground guibg=" .. colors.insert.primary .. " guifg=" .. colors.text
		)
		vim.api.nvim_command(
			"hi StatusLineSecondaryForeground guibg=" .. colors.insert.secondary .. " guifg=" .. colors.insert.primary
		)
	elseif mode == "R" or mode == "Rv" then
		vim.api.nvim_command(
			"hi StatusLinePrimaryBackground guibg=" .. colors.none .. " guifg=" .. colors.replace.primary
		)
		vim.api.nvim_command(
			"hi StatusLinePrimaryForeground guibg=" .. colors.replace.primary .. " guifg=" .. colors.text
		)
		vim.api.nvim_command(
			"hi StatusLineSecondaryForeground guibg=" .. colors.replace.secondary .. " guifg=" .. colors.replace.primary
		)
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
	local right_separator = highlights.secondary_background .. " "
	local left_separator = highlights.secondary_background .. ""
	local modified = highlights.secondary_foreground .. "  "

	if vim.bo.modified then
		return table.concat({
			left_separator,
			modified,
			right_separator,
		})
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
	local lsp_diagnostics = highlights.secondary_background .. lsp_diagnostics()
	local starting_separator = highlights.primary_background .. " "
	local ending_separator = highlights.primary_background .. " "
	local right_separator = highlights.primary_background .. ""
	local left_separator = highlights.primary_background .. " "
	local modified = highlights.primary_foreground .. modified()
	local position = highlights.primary_foreground .. " %l:%c "
	local filename = highlights.primary_foreground .. "%t "
	local icon = highlights.primary_foreground .. icon()
	local no_content = highlights.no_content
	local spacer = "%="

	return table.concat({
		starting_separator,
		icon,
		filename,
		right_separator,
		modified,
		lsp_diagnostics,
		no_content,
		spacer,
		left_separator,
		position,
		no_content,
		ending_separator,
	})
end

-- Construct inactive statusline
local function inactive()
	local starting_separator = highlights.inactive_background .. " "
	local right_separator = highlights.inactive_background .. " "
	local left_separator = highlights.inactive_background .. " "
	local filename = highlights.inactive_foreground .. "%t "
	local icon = highlights.inactive_foreground .. icon()

	return table.concat({
		starting_separator,
		icon,
		filename,
		right_separator,
	})
end

-- Construct tree statusline
local function tree()
	local no_content = highlights.no_content
	return no_content
end

-- Set statusline colors and return statusline based on status
function statusline(status)
	set_highlights()
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
