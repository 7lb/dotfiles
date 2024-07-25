local M = {}

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
		--stopOnEntry = false,
		stopAtBeginningOfMainSubprogram = false,
		args = {},
	}}

	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp
end

return M
