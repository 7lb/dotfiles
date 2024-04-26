local M = {}

M.init = function()
	local leap = require("leap")

	vim.keymap.set("n", "s", "<Plug>(leap)")
	vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
	vim.keymap.set({"x", "o"}, "s", "<Plug>(leap-forward)")
	vim.keymap.set({"x", "o"}, "S", "<Plug>(leap-backward)")
end

return M
