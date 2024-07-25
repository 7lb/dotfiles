local M = {}

M.opts = {
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text_pos = "eol",
		delay = 100,
	},
	current_line_blame_formatter = "<abbrev_sha> <author>, <author_time:%Y-%m-%d> - <summary>",
}

return M
