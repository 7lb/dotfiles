local M = {}

M.config = function()
	require("dressing").setup({
		input = {
			border = "single",
			relative = "editor",
		},
		select = {
			backend = { "telescope", "builtin" },
			telescope = require("telescope.themes").get_dropdown({
				borderchars = {
					prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
					preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				},
			}),
			builtin = {
				border = "single",
			},
		},
	})
end

return M
