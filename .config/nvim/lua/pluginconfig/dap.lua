local M = { "mfussenegger/nvim-dap" }

M.config = function()
	local dap = require("dap")

	dap.adapters.lldb = {
		type = "executable",
		command = "/usr/bin/lldb-dap",
		name = "lldb",
	}

	dap.adapters.gdb = {
		type = "executable",
		command = "gdb",
		args = { "-i", "dap" }
	}

	dap.configurations.cpp = {{
		name = "Launch",
		type = "lldb",
		--type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		stopAtBeginningOfMainSubprogram = false,
		runInTerminal = true,
		console = "integratedTerminal",
		args = {},
	}}

	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp

	local dap_toggle_breakpoint = "<CMD>lua require('dap').toggle_breakpoint()<CR>"
	local dap_set_logpoint = "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Msg: '))<CR>"
	local dap_continue = "<CMD>lua require('dap').continue()<CR>"
	local dap_step_over = "<CMD>lua require('dap').step_over()<CR>"
	local dap_step_into = "<CMD>lua require('dap').step_into()<CR>"
	local dap_step_out = "<CMD>lua require('dap').step_out()<CR>"
	local dap_repl = "<CMD>lua require('dap').repl.open()<CR>"
	local dap_up = "<CMD>lua require('dap').up()<CR>"
	local dap_down = "<CMD>lua require('dap').down()<CR>"

	vim.api.nvim_set_keymap("n", "<Leader>db", dap_toggle_breakpoint, { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>dl", dap_set_logpoint, { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>dc", dap_continue, { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>ds", dap_step_over, { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>di", dap_step_into, { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>do", dap_step_out, { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>dr", dap_repl, { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>dj", dap_up, { noremap = true })
	vim.api.nvim_set_keymap("n", "<Leader>dk", dap_down, { noremap = true })
end

return M
