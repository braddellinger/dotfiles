local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.black,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						-- To disable all formatters but null-ls, uncomment filter
						-- filter = function(client)
						--     return client.name == "null-ls"
						-- end
					})
				end,
			})
		end
	end,
})
