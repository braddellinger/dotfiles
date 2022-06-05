-- Return file icon if applicable
local function icon(bufname)
	local icon = require("nvim-web-devicons").get_icon(bufname, vim.fn.fnamemodify(bufname, ":e"), { default = true })
	if icon then
		return " " .. icon .. " "
	else
		return " "
	end
end

-- Set colors based on mode
function set_colors()
	vim.api.nvim_command("hi TabLineInactiveBackground guibg=none guifg=#5C6370")
	vim.api.nvim_command("hi TabLineInactiveForeground guibg=#5C6370 guifg=black")

	local mode = vim.api.nvim_get_mode().mode
	if mode == "n" or mode == "c" then
		vim.api.nvim_command("hi TabLineBackground guibg=none guifg=#62d196")
		vim.api.nvim_command("hi TabLineForeground guibg=#62d196 guifg=black")
	elseif mode == "v" or mode == "V" or mode == "^V" then
		vim.api.nvim_command("hi TabLineBackground guibg=none guifg=#65b2ff")
		vim.api.nvim_command("hi TabLineForeground guibg=#65b2ff guifg=black")
	elseif mode == "i" then
		vim.api.nvim_command("hi TabLineBackground guibg=none guifg=#ff8080")
		vim.api.nvim_command("hi TabLineForeground guibg=#ff8080 guifg=black")
	elseif mode == "R" or mode == "Rv" then
		vim.api.nvim_command("hi TabLineBackground guibg=none guifg=#E5C07B")
		vim.api.nvim_command("hi TabLineForeground guibg=#E5C07B guifg=black")
	end
end

-- Construct tabline
function tabline()
	set_colors()
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
			table.insert(tl, "%#TabLineBackground#")
			table.insert(tl, "%#TabLineForeground#" .. bufs .. " ")
			table.insert(tl, "%#TabLineBackground#")
		else
			table.insert(tl, "%#TabLineInactiveBackground#")
			table.insert(tl, "%#TabLineInactiveForeground#" .. bufs .. " ")
			table.insert(tl, "%#TabLineInactiveBackground#")
		end

		if t ~= tabcount then
			table.insert(tl, "  ")
		end
	end

	table.insert(tl, "%=")
	return table.concat(tl)
end

vim.o.tabline = [[%!v:lua.tabline()]]
