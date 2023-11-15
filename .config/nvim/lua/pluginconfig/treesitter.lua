local M = {}

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

return M
