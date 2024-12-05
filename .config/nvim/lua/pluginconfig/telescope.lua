local M = { "nvim-telescope/telescope.nvim" }

Mdependencies = {
	"nvim-lua/plenary.nvim",
	"FeiyouG/commander.nvim",
	"nvim-telescope/telescope-fzf-native.nvim",
}

M.branch = "0.1.x"

M.config = function(plugin, opts)
	local telescope = require("telescope")
	telescope.load_extension("fzf")
	telescope.setup(opts)

	local cmd_center = "<CMD>Telescope commander<CR>"
	local find_files = "<CMD>Telescope find_files<CR>"

	vim.api.nvim_set_keymap("n", "<A-p>", cmd_center, { noremap = true })
	vim.api.nvim_set_keymap("n", "<C-p>", find_files, { noremap = true })
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
