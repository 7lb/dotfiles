local M = {}

M.config = function(plugin, opts)
	local telescope = require("telescope")
	telescope.load_extension("fzf")
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
				"--hidden",
				"--type", "f",
				"--strip-cwd-prefix",

				"--exclude", ".git/",
				"--exclude", "node_modules/",
			},
		},
	},
}

return M
