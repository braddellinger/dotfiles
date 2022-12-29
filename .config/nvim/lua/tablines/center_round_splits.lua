-- Set highlights based on mode
function set_highlights()
	vim.api.nvim_set_hl(0, "TabLine", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "TabLineInactiveSeparators", {
		fg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
	})
	vim.api.nvim_set_hl(0, "TabLineInactiveText", {
		fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		bg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
	})

	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" or mode == "c" then
		vim.api.nvim_set_hl(0, "TabLineSeparators", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticHint", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
		vim.api.nvim_set_hl(0, "TabLineText", {
			fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
			bg = vim.api.nvim_get_hl_by_name("DiagnosticHint", true).foreground,
		})
	elseif mode == "v" or mode == "V" or mode == "^V" then
		vim.api.nvim_set_hl(0, "TabLineSeparators", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticInfo", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
		vim.api.nvim_set_hl(0, "TabLineText", {
			fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
			bg = vim.api.nvim_get_hl_by_name("DiagnosticInfo", true).foreground,
		})
	elseif mode == "i" then
		vim.api.nvim_set_hl(0, "TabLineSeparators", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticWarn", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
		vim.api.nvim_set_hl(0, "TabLineText", {
			fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
			bg = vim.api.nvim_get_hl_by_name("DiagnosticWarn", true).foreground,
		})
	elseif mode == "R" or mode == "Rv" then
		vim.api.nvim_set_hl(0, "TabLineSeparators", {
			fg = vim.api.nvim_get_hl_by_name("DiagnosticError", true).foreground,
			bg = vim.api.nvim_get_hl_by_name("Normal", true).background,
		})
		vim.api.nvim_set_hl(0, "TabLineText", {
			fg = vim.api.nvim_get_hl_by_name("Normal", true).background,
			bg = vim.api.nvim_get_hl_by_name("DiagnosticError", true).foreground,
		})
	end
end

-- Return file icon if applicable
local function icon(bufname)
	local icon = require("nvim-web-devicons").get_icon(bufname, vim.fn.fnamemodify(bufname, ":e"), { default = true })
	if icon then
		return " " .. icon .. " "
	else
		return " "
	end
end

-- Construct tabline
function tabline()
	set_highlights()
	local tl = { "%=" }
	local tabcount = vim.fn.tabpagenr("$")
	for t = 1, tabcount do
		local buflist = vim.fn.tabpagebuflist(t)

		-- Tab name displays all buffers within it.
		-- Check buftype to ignore temp buffers like floating windows.
		local bufs = ""
		for i, bufnr in ipairs(buflist) do
			local bufname = vim.fn.bufname(bufnr)
			if bufname == "" and vim.api.nvim_buf_get_option(bufnr, "buftype") == "" then
				bufname = "[No Name]"
			end
			local shortname = vim.fn.fnamemodify(bufname, ":t")

			local bufmodified = (vim.fn.getbufvar(bufnr, "&mod") == 1 and "  " or "")

			if i == 1 then
				bufs = bufs .. icon(bufname) .. shortname .. bufmodified
			else
				if bufname ~= "" then
					bufs = bufs .. "  | " .. icon(bufname) .. shortname .. bufmodified
				end
			end
		end

		if t == vim.fn.tabpagenr() then
			table.insert(tl, "%#TabLineSeparators#")
			table.insert(tl, "%#TabLineText#" .. bufs .. " ")
			table.insert(tl, "%#TabLineSeparators#")
		else
			table.insert(tl, "%#TabLineInactiveSeparators#")
			table.insert(tl, "%#TabLineInactiveText#" .. bufs .. " ")
			table.insert(tl, "%#TabLineInactiveSeparators#")
		end

		if t ~= tabcount then
			table.insert(tl, "  ")
		end
	end

	table.insert(tl, "%=")
	return table.concat(tl)
end

vim.o.tabline = [[%!v:lua.tabline()]]
