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

local function pum_remap(lhs, rhs)
	return vim.fn.pumvisible() == 1 and lhs or rhs
end

local pum_funcs = {
	["<tab>"] = function() return pum_remap("<C-n>", "<tab>") end,
	["<S-tab>"] = function() return pum_remap("<C-p>", "<S-tab>") end,
	["<esc>"] = function() return pum_remap("<C-e>", "<esc>") end,
	["<cr>"] = function() return pum_remap("<C-y>", "<cr>") end,
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.opt.shortmess = vim.opt.shortmess + "c"
		vim.opt.signcolumn = "yes"
		vim.opt.completeopt = "fuzzy,popup,menu,menuone,noinsert"

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
		vim.keymap.set("i", "<C-space>", "<C-x><C-o>", { buffer = args.buf })
		vim.keymap.set("i", "<tab>", pum_funcs["<tab>"], { buffer = args.buf, expr = true })
		vim.keymap.set("i", "<S-tab>", pum_funcs["<S-tab>"], { buffer = args.buf, expr = true })
		vim.keymap.set("i", "<esc>", pum_funcs["<esc>"], { buffer = args.buf, expr = true })
		vim.keymap.set("i", "<cr>", pum_funcs["<cr>"], { buffer = args.buf, expr = true })

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
