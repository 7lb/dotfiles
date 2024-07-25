local M = {}

M.config = function(plugin, opts)
	local telescope = require("telescope")
	telescope.load_extension("fzf")
	telescope.load_extension("session-lens")
	telescope.setup(opts)
end

M.opts = {
	defaults = {
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},

	pickers = {
		find_files = {
			find_command = {
				"fd",
				"--type", "f",
				"--strip-cwd-prefix",

				"--exclude", ".git/",
				"--exclude", "node_modules/",
			},
		},
	},
}

return M
