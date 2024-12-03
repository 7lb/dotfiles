local M = { "nvim-treesitter/nvim-treesitter" }

M.dependencies = { "nvim-lspconfig" }

M.main = "nvim-treesitter.configs"

M.opts = {
	ensure_installed = {
		"bash", "c", "cpp", "lua", "query", "vim", "vimdoc", "zig",
	},
	sync_install = false,

	highlight = { enable = true },
	playground = {
		enable = true,
		updatetime = 25,
	},
}

M.build = ":TSUpdate"

return M
