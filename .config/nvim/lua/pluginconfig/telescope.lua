local M = {}

M.config = function()
	local telescope = require("telescope")
	telescope.load_extension("session-lens")
end

M.opts = {
	defaults = {
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},
}

return M
