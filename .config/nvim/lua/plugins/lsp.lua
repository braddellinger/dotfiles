return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			-- Set up lsp servers
			local servers = { "pyright", "gopls", "eslint", "tsserver", "jsonls" }
			for _, lsp in ipairs(servers) do
				require("lspconfig")[lsp].setup({ on_attach = on_attach })
			end

			-- Keymaps
			local on_attach = function(client, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
				local bufopts = { silent = true, buffer = bufnr }
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
				vim.keymap.set("n", "grn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "gca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "gf", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)
			end

			-- Diagnostic signs
			for name, icon in pairs(vim.g.diagnosticsigns) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end

			-- Diagnostic popup configurations
			vim.diagnostic.config({
				float = {
					prefix = function(diagnostic, i, total)
						sign = "?"
						hl = ""
						if diagnostic.severity == vim.diagnostic.severity.HINT then
							sign = vim.g.diagnosticsigns.Hint
							hl = "DiagnosticHint"
						elseif diagnostic.severity == vim.diagnostic.severity.INFO then
							sign = vim.g.diagnosticsigns.Info
							hl = "DiagnosticInfo"
						elseif diagnostic.severity == vim.diagnostic.severity.WARN then
							sign = vim.g.diagnosticsigns.Warn
							hl = "DiagnosticWarn"
						elseif diagnostic.severity == vim.diagnostic.severity.ERROR then
							sign = vim.g.diagnosticsigns.Error
							hl = "DiagnosticError"
						end
						return " " .. sign .. "  ", hl
					end,
					border = vim.g.border,
					focusable = false,
					source = false,
					scope = "line",
					suffix = " ",
					header = "",
				},
				update_in_insert = false,
				severity_sort = true,
				virtual_text = false,
				underline = true,
			})

			-- Display diagnostics on cursor hold
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = bufnr,
				callback = function()
					vim.diagnostic.open_float()
				end,
			})
		end,
	},
}
