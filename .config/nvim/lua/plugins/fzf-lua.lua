return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		actions = {
			files = {
				true, -- inherit default actions
				["ctrl-p"] = {
					header = "change root",
					fn = function()
						local fzf = require("fzf-lua")
						local prefix = "/home"
						fzf.fzf_exec("fd --no-ignore --type d", {
							prompt = "Dirs❯ ",
							cwd = prefix,
							actions = {
								["default"] = function(selected, opts)
									fzf.files({ cwd = prefix .. '/' .. selected[1] })
								end,
							}
						})
					end,
				},
			},
		},
	},
}
