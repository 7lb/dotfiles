local dap = require("dap")
local dapui = require("dapui")

dap.listeners.after.event_initialized.dapui_config = function()
  dapui.open()
end

--require("dapui").setup()
require("dapui").setup({
	layouts = {{
		elements = {{
			id = "scopes",
			size = 0.5,
		}, {
			id = "repl",
			size = 0.5,
		}},
		position = "bottom",
		size = 20,
	}, {
		elements = {{
			id = "stacks",
			size = 0.7,
		}, {
			id = "watches",
			size = 0.3,
		}},
		position = "left",
		size = 60,
	}},
})
