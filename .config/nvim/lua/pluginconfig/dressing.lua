local M = { "stevearc/dressing.nvim" }

M.dependencies = { "nvim-telescope/telescope.nvim" }

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
