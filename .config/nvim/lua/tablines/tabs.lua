-- Return file icon if applicable
local function icon(bufname, active)
	local icon, hl =
		require("nvim-web-devicons").get_icon(bufname, vim.fn.fnamemodify(bufname, ":e"), { default = true })
	return (active and "%#" .. hl .. "#" or "%#TabLineInactive#") .. icon .. " "
end

-- Construct tabline
function tabline()
	vim.api.nvim_set_hl(0, "TabLine", {
		fg = vim.api.nvim_get_hl_by_name("Normal", true).foreground,
		bg = vim.api.nvim_get_hl_by_name("Folded", true).background,
	})
	vim.api.nvim_set_hl(0, "TabLineInactive", {
		fg = vim.api.nvim_get_hl_by_name("Comment", true).foreground,
		bg = vim.api.nvim_get_hl_by_name("Folded", true).background,
	})

	local tl = {}
	local tabcount = vim.fn.tabpagenr("$")
	for t = 1, tabcount do
		local buflist = vim.fn.tabpagebuflist(t)

		-- Tab name displays all buffers within it
		local bufs = ""
		for i, bufnr in ipairs(buflist) do
			local bufname = vim.fn.bufname(bufnr)

			-- Unnamed buffers
			if bufname == "" and vim.api.nvim_buf_get_option(bufnr, "buftype") == "" then
				bufname = "[No Name]"
			end

			local shortname = vim.fn.fnamemodify(bufname, ":t")
			local bufmodified = (vim.fn.getbufvar(bufnr, "&mod") == 1 and "  " or "")

			-- Active/inactive tabs
			local active
			if t == vim.fn.tabpagenr() then
				hl = "%#Normal#"
				active = true
			else
				hl = "%#TabLineInactive#"
				active = false
			end

			-- First/other buffers
			if i == 1 then
				bufs = hl .. "  " .. bufs .. icon(bufname, active) .. hl .. shortname .. bufmodified .. "  "
			else
				if bufname ~= "" then
					bufs = "%#Normal#"
						.. bufs
						.. "|  "
						.. icon(bufname, active)
						.. hl
						.. shortname
						.. bufmodified
						.. "  "
				end
			end
		end

		table.insert(tl, bufs .. "%#TabLine#")
	end

	return table.concat(tl)
end

vim.opt.tabline = [[%!v:lua.tabline()]]
