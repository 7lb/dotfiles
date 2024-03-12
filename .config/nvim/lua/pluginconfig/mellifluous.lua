local M = {}

M.config = function()
	local mellifluous = require("mellifluous")
	mellifluous.setup({
		neutral = true,
		color_set = "mellifluous",
		mellifluous = {
			neutral = true,
			bg_contrast = "hard",
		},
	})

	vim.cmd("colorscheme mellifluous")
end

return M
