-- Map keys to highlight groups
local highlights = {
	inactive_text = "%#StatusLineInactiveText#",
	no_content = "%#StatusLine#",
	text = "%#StatusLineText#",
}

-- Set highlights based on mode
local function set_highlights()
	vim.api.nvim_set_hl(0, "StatusLine", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLineInactiveText", {
		fg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
	})

	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" or mode == "c" then
		vim.api.nvim_set_hl(0, "StatusLineText", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticHint", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
	elseif mode == "v" or mode == "V" or mode == "^V" then
		vim.api.nvim_set_hl(0, "StatusLineText", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticInfo", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
	elseif mode == "i" then
		vim.api.nvim_set_hl(0, "StatusLineText", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticWarn", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
	elseif mode == "R" or mode == "Rv" then
		vim.api.nvim_set_hl(0, "StatusLineText", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticError", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
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
		display = display .. "%#DiagnosticError# " .. vim.g.diagnosticsigns.Error .. " "
	end
	if #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }) > 0 then
		display = display .. "%#DiagnosticWarn# " .. vim.g.diagnosticsigns.Warn .. " "
	end
	if #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }) > 0 then
		display = display .. "%#DiagnosticInfo# " .. vim.g.diagnosticsigns.Info .. " "
	end
	if #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }) > 0 then
		display = display .. "%#DiagnosticHint# " .. vim.g.diagnosticsigns.Hint .. " "
	end
	return display
end

-- Construct active statusline
local function active()
	local lsp_diagnostics = highlights.text .. lsp_diagnostics()
	local modified = highlights.text .. modified()
	local position = highlights.text .. " %l:%c "
	local filename = highlights.text .. "%t "
	local icon = highlights.text .. icon()
	local spacer = "%="

	return table.concat({
		icon,
		filename,
		modified,
		spacer,
		lsp_diagnostics,
		position,
	})
end

-- Construct inactive statusline
local function inactive()
	local filename = highlights.inactive_text .. "%t "
	local icon = highlights.inactive_text .. icon()

	return table.concat({
		icon,
		filename,
	})
end

-- Set statusline colors and return statusline based on status
function statusline(status)
	set_highlights()
	if status == "active" then
		return active()
	elseif status == "inactive" then
		return inactive()
	end
end

-- Set statusline on enter/leave
vim.api.nvim_create_augroup("statusline", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	pattern = "*",
	group = "statusline",
	callback = function()
		vim.opt_local.statusline = statusline("active")
	end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	pattern = "*",
	group = "statusline",
	callback = function()
		vim.opt_local.statusline = statusline("inactive")
	end,
})
