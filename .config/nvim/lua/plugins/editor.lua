return {
	{
		"numToStr/Comment.nvim",
		event = "BufReadPost",
		opts = {},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		opts = function()
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.prettier,
					-- nls.builtins.diagnostics.eslint,
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.black,
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
			}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			-- "hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
		},
		opts = function()
			local cmp = require("cmp")
			local icons = {
				Text = " ",
				Method = " ",
				Function = " ",
				Constructor = " ",
				Field = "ﰠ ",
				Variable = " ",
				Class = "ﴯ ",
				Interface = " ",
				Module = " ",
				Property = "ﰠ ",
				Unit = "塞 ",
				Value = " ",
				Enum = " ",
				Keyword = " ",
				Snippet = " ",
				Color = " ",
				File = " ",
				Reference = " ",
				Folder = " ",
				EnumMember = " ",
				Constant = " ",
				Struct = "פּ ",
				Event = " ",
				Operator = " ",
				TypeParameter = "",
			}
			return {
				mapping = {
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<Esc>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "cmdline" },
					{ name = "buffer" },
					{ name = "calc" },
					{ name = "path" },
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(_, vim_item)
						vim_item.menu = vim_item.kind
						vim_item.kind = icons[vim_item.kind]
						return vim_item
					end,
				},
				window = {
					documentation = cmp.config.window.bordered(),
					completion = cmp.config.window.bordered(),
				},
			}
		end,
	},
}
