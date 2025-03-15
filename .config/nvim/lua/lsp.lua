vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--all-scopes-completion",
		"--completion-style=detailed",
		"--cross-file-rename",
	},

	root_markers = {
		".clangd",
		"clang-format",
		"compile_commands.json",
	},

	filetypes = { "c", "cpp" },
})

vim.lsp.config("zls", {
	cmd = { "zls" },

	root_markers = {
		"build.zig",
		"build.zig.zon",
	},

	filetypes = { "zig" },
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })

		vim.keymap.del("n", "K", { buffer = args.buf })

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = args.buf })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf })
		vim.keymap.set("n", "g?", vim.lsp.buf.signature_help, { buffer = args.buf })
		vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = args.buf })
		vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, { buffer = args.buf })
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = args.buf })
		vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = args.buf })

		vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = false })

		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end,
			})
		end

		if client:supports_method("textDocument/switchSourceHeader") then
			vim.keymap.set("n", "go", function()
				local params = vim.lsp.util.make_text_document_params(args.buf)
				client:request("textDocument/switchSourceHeader", params, function(err, result)
					if err then
						error(tostring(err))
					end

					if not result then
						return vim.notify("couldn't determine corresponding file")
					end

					vim.cmd.edit(vim.uri_to_fname(result))
				end, bufnr)
			end, { buffer = args.buf })
		end
	end,
})

vim.lsp.enable("clangd")
vim.lsp.enable("zls")
