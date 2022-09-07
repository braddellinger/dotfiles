-- Diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })

-- Lsp setup
require("lspconfig").tsserver.setup({})
require("lspconfig").pyright.setup({})
-- require("lspconfig").jsonls.setup({})
-- require("lspconfig").yamlls.setup({})
-- require("lspconfig").cssls.setup({})
-- require("lspconfig").html.setup({})
require("lspconfig").eslint.setup({})
require("lspconfig").gopls.setup({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = { unusedparams = true },
			staticcheck = true,
		},
	},
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "gq", vim.diagnostic.setloclist, opts)

-- Custom on_attach function
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "gwa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "gwr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "gwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	-- vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "grn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gf", vim.lsp.buf.formatting, bufopts)
end

-- Use a loop to conveniently setup all LSP servers
local servers = { "pyright", "gopls", "eslint", "tsserver" }
for _, lsp in ipairs(servers) do
	require("lspconfig")[lsp].setup({ on_attach = on_attach })
end

-- Go: Organize imports on save
function goimports(timeout_ms)
	local context = { source = { organizeImports = true } }
	vim.validate({ context = { context, "t", true } })

	local params = vim.lsp.util.make_range_params()
	params.context = context

	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
	if not result or next(result) == nil then
		return
	end
	local actions = result[1].result
	if not actions then
		return
	end
	local action = actions[1]

	if action.edit or type(action.command) == "table" then
		if action.edit then
			vim.lsp.util.apply_workspace_edit(action.edit)
		end
		if type(action.command) == "table" then
			vim.lsp.buf.execute_command(action.command)
		end
	else
		vim.lsp.buf.execute_command(action)
	end
end
vim.cmd("autocmd BufWritePre *.go lua goimports(1000)")

-- Diagnostic popup configurations
vim.diagnostic.config({
	float = {
		prefix = function(diagnostic, i, total)
			sign = "?"
			hl = ""
			if diagnostic.severity == vim.diagnostic.severity.HINT then
				sign = ""
				hl = "DiagnosticHint"
			elseif diagnostic.severity == vim.diagnostic.severity.INFO then
				sign = ""
				hl = "DiagnosticInfo"
			elseif diagnostic.severity == vim.diagnostic.severity.WARN then
				sign = ""
				hl = "DiagnosticWarn"
			elseif diagnostic.severity == vim.diagnostic.severity.ERROR then
				sign = ""
				hl = "DiagnosticError"
			end
			return sign .. "  ", hl
		end,
		border = vim.g.border,
		focusable = false,
		source = false,
		scope = "line",
		header = "",
	},
	update_in_insert = false,
	severity_sort = true,
	virtual_text = false,
	underline = true,
})

-- Display line diagnostics on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = { "*" },
	command = "lua vim.diagnostic.open_float()",
})
