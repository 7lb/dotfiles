local M = { "FeiyouG/commander.nvim" }

M.init = function()
	local cmdc = require("commander")
	cmdc.add({{
		desc = "Files",
		cmd = "<CMD>Telescope find_files<CR>",
	}, {
		desc = "Find",
		cmd = "<CMD>Telescope live_grep<CR>",
	}, {
		desc = "Find in Buffer",
		cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
	}, {
		desc = "Symbols",
		cmd = "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>",
	}, {
		desc = "Quickfix",
		cmd = "<CMD>Telescope quickfix<CR>",
	}, {
		desc = "Trouble",
		cmd = "<CMD>TroubleToggle<CR>",
	}, {
		desc = "DAP UI",
		cmd = "<CMD>lua require('dapui').toggle()<CR>",
	}})
end

M.opts = {
	integration = {
		telescope = {
			enable = true,
		},
		lazy = {
			enable = true,
		},
	},
}

return M
