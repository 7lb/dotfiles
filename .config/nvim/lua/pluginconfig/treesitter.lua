local M = {}

M.opts = {
	ensure_installed = {
		"lua", "vim", "vimdoc", "query",
		"c", "cpp", "bash"
	},
	sync_install = false,

	highlight = { enable = true },
	playground = {
		enable = true,
		updatetime = 25,
	},
}

return M
