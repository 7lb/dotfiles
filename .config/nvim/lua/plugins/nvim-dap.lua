local function _input(opts, input_transform)
	return coroutine.create(function(c)
		vim.ui.input(opts, function(input)
			if input_transform ~= nil then
				input = input_transform(input)
			end

			coroutine.resume(c, input)
		end)
	end)
end

local function _select(items, opts, choice_transform)
	return coroutine.create(function(c)
		vim.ui.select(items, opts, function(choice)
			if choice_transform ~= nil then
				choice = choice_transform(choice)
			end

			coroutine.resume(c, choice)
		end)
	end)
end

local function get_executables()
	local fd_cmd = "fd"
		.. " --no-ignore"
		.. " --type x"
		.. " --exclude .git"
		.. " --exclude *.so*"
		.. " --exclude *.flac"
		.. " --exclude *.mp3"

	local cmd = io.popen(fd_cmd)
	local result = cmd:read("*a")
	cmd:close()

	local executables = vim.split(result, '\n', { trimempty = true })
	return _select(executables, { prompt = "executable to launch" })
end

local function get_pids()
	local cmd = io.popen("ps -a -o 'pid:1,cmd' --no-headers")
	local result = cmd:read("*a")
	cmd:close()

	local pids = vim.split(result, '\n', { trimempty = true })
	return _select(pids, { prompt = "pid to attach to" }, function(choice)
		return tonumber(vim.split(choice, ' ')[1])
	end)
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "igorlfs/nvim-dap-view", opts = { windows = { terminal = { hide = { "gdb" } } } } },
	},

	config = function()
		local dap = require("dap")
		local dv = require("dap-view")

		dap.listeners.before.launch["dap-view-config"] = function() dv.open() end
		dap.listeners.before.attach["dap-view-config"] = function() dv.open() end
		dap.listeners.before.event_terminated["dap-view-config"] = function() dv.close(true) end
		dap.listeners.before.event_exited["dap-view-config"] = function() dv.close(true) end

		dap.adapters.gdb = {
			name = "gdb",
			type = "executable",
			command = "/usr/sbin/gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.adapters.lldb = {
			name = "lldb",
			type = "executable",
			command = "/usr/sbin/lldb-dap",
		}

		dap.configurations.cpp = {{
			name = "gdb launch",
			type = "gdb",
			request = "launch",
			program = get_executables,
			cwd = "${workspaceFolder}",
			stopAtBeginningOfMainSubprogram = false,
		}, {
			name = "lldb launch",
			type = "lldb",
			request = "launch",
			program = get_executables,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			runInTerminal = true,
		}, {
			name = "gdb attach",
			type = "gdb",
			request = "attach",
			pid = get_pids,
			cwd = "${workspaceFolder}",
		}, {
			name = "lldb attach",
			type = "lldb",
			request = "attach",
			pid = get_pids,
			cwd = "${workspaceFolder}",
		}}
	end,
}
