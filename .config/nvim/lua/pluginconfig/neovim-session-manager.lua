local M = { "Shatur/neovim-session-manager" }

M.dependencies = { "nvim-lua/plenary.nvim" }

M.config = function(plugin, opts)
	local config = require("session_manager.config")
	require("session_manager").setup({
		autoload_mode = config.AutoloadMode.CurrentDir,
		autosave_only_in_session = true,
	})
end

return M
