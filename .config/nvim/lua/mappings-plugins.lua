-- fzf-lua
vim.keymap.set("n", "<C-x>", ":FzfLua builtin<cr>")
vim.keymap.set("n", "<C-p>", ":FzfLua files<cr>")

-- leap
vim.keymap.set("n", "s", "<plug>(leap)")
vim.keymap.set("n", "gs", "<plug>(leap-from-window)")

-- dap
vim.keymap.set("n", "<leader>dc", "<cmd> lua require('dap').continue()<cr>")
vim.keymap.set("n", "<leader>ds", "<cmd> lua require('dap').step_over()<cr>")
vim.keymap.set("n", "<leader>di", "<cmd> lua require('dap').step_into()<cr>")
vim.keymap.set("n", "<leader>do", "<cmd> lua require('dap').step_out()<cr>")
vim.keymap.set("n", "<leader>db", "<cmd> lua require('dap').toggle_breakpoint()<cr>")

vim.keymap.set("n", "<leader>dj", function()
	require("dap").up()
	if _G.dap_frame_widget ~= nil then
		_G.dap_frame_widget.toggle()
		_G.dap_frame_widget.toggle()
	end
end)

vim.keymap.set("n", "<leader>dk", function()
	require("dap").down()
	if _G.dap_frame_widget ~= nil then
		_G.dap_frame_widget.toggle()
		_G.dap_frame_widget.toggle()
	end
end)

vim.keymap.set("n", "<leader>dd", function()
	local widgets = require('dap.ui.widgets')
	if _G.dap_scope_widget == nil then
		_G.dap_scope_widget = widgets.centered_float(widgets.scopes, { border = "rounded" })
		return
	end

	_G.dap_scope_widget.toggle()
end)

vim.keymap.set("n", "<leader>df", function()
	local widgets = require('dap.ui.widgets')
	if _G.dap_frame_widget == nil then
		_G.dap_frame_widget = widgets.centered_float(widgets.frames, { border = "rounded" } )
		return
	end

	_G.dap_frame_widget.toggle()
end)

vim.keymap.set("n", "<leader>dh", function()
	local widgets = require('dap.ui.widgets')
	if _G.dap_hover_widget == nil then
		_G.dap_hover_widget = widgets.hover(nil, { border = "rounded" })
		return
	end

	_G.dap_hover_widget.toggle()
end)
