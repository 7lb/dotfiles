local M = { "folke/trouble.nvim" }

M.opts = {
	win = {
		position = "right",
		size = 80,
	}
}

M.config = function()
	local trouble_toggle = "<CMD>Trouble diagnostics toggle<CR>"
	vim.api.nvim_set_keymap("n", "<Leader>tt", trouble_toggle, { noremap = true })
end

return M
