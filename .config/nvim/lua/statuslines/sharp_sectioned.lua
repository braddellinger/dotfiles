-- Map keys to highlight groups
local highlights = {
	secondary_separators = "%#StatusLineSecondarySeparators#",
	inactive_separators = "%#StatusLineInactiveSeparators#",
	primary_separators = "%#StatusLinePrimarySeparators#",
	secondary_text = "%#StatusLineSecondaryText#",
	inactive_text = "%#StatusLineInactiveText#",
	primary_text = "%#StatusLinePrimaryText#",
	no_content = "%#StatusLine#",
}

-- Set highlights based on mode
local function set_highlights()
	vim.api.nvim_set_hl(0, "StatusLine", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLineInactiveSeparators", {
		fg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
	})
	vim.api.nvim_set_hl(0, "StatusLineInactiveText", {
		fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		bg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
	})
	vim.api.nvim_set_hl(0, "StatusLineSecondarySeparators", {
		fg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
	})

	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" or mode == "c" then
		vim.api.nvim_set_hl(0, "StatusLinePrimarySeparators", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticHint", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
		vim.api.nvim_set_hl(0, "StatusLinePrimaryText", {
			fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
			bg = vim.api.nvim_get_hl_by_name("DiagnosticHint", true).foreground,
		})
		vim.api.nvim_set_hl(0, "StatusLineSecondaryText", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticHint", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
		})
	elseif mode == "v" or mode == "V" or mode == "^V" then
		vim.api.nvim_set_hl(0, "StatusLinePrimarySeparators", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticInfo", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
		vim.api.nvim_set_hl(0, "StatusLinePrimaryText", {
			fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
			bg = vim.api.nvim_get_hl_by_name("DiagnosticInfo", true).foreground,
		})
		vim.api.nvim_set_hl(0, "StatusLineSecondaryText", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticInfo", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
		})
	elseif mode == "i" then
		vim.api.nvim_set_hl(0, "StatusLinePrimarySeparators", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticWarn", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
		vim.api.nvim_set_hl(0, "StatusLinePrimaryText", {
			fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
			bg = vim.api.nvim_get_hl_by_name("DiagnosticWarn", true).foreground,
		})
		vim.api.nvim_set_hl(0, "StatusLineSecondaryText", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticWarn", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
		})
	elseif mode == "R" or mode == "Rv" then
		vim.api.nvim_set_hl(0, "StatusLinePrimarySeparators", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticError", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
		vim.api.nvim_set_hl(0, "StatusLinePrimaryText", {
			fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
			bg = vim.api.nvim_get_hl_by_name("DiagnosticError", true).foreground,
		})
		vim.api.nvim_set_hl(0, "StatusLineSecondaryText", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticError", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
		})
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
	local right_separator = highlights.secondary_separators .. " "
	local left_separator = highlights.secondary_separators .. ""
	local modified = highlights.secondary_text .. "  "

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
	local lsp_diagnostics = highlights.secondary_separators .. lsp_diagnostics()
	local starting_separator = highlights.primary_separators .. " "
	local ending_separator = highlights.primary_separators .. " "
	local right_separator = highlights.primary_separators .. ""
	local left_separator = highlights.primary_separators .. " "
	local modified = highlights.primary_text .. modified()
	local position = highlights.primary_text .. " %l:%c "
	local filename = highlights.primary_text .. "%t "
	local icon = highlights.primary_text .. icon()
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
	local starting_separator = highlights.inactive_separators .. " "
	local right_separator = highlights.inactive_separators .. " "
	local left_separator = highlights.inactive_separators .. " "
	local filename = highlights.inactive_text .. "%t "
	local icon = highlights.inactive_text .. icon()

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

-- Set statusline highlights and return statusline based on status
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
