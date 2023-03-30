local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		vim.opt.cmdheight = 2
		vim.opt.updatetime = 300
		vim.opt.shortmess = vim.opt.shortmess + "c"
		vim.opt.signcolumn = "yes"

		-- code navigation
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<CMD>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "go", "<CMD>ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gy", "<CMD>Telescope lsp_type_definitions<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<CMD>Telescope lsp_references<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "g?", "<CMD>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

		-- edit actions
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<CMD>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<CMD>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
	end,

	flags = {
		debounce_text_changes = 150,
	},

	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),

	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--all-scopes-completion",
		"--completion-style=detailed",
		"--fallback-style=webkit",
		"--cross-file-rename",
	},
})
