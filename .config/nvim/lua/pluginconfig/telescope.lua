require("telescope").setup({
	defaults = {
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},
})

require("telescope").load_extension("session-lens")
require("telescope").load_extension("command_center")
