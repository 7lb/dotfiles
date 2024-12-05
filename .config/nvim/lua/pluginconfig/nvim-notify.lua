local M = { "rcarriga/nvim-notify" }

M. dependencies = {
	"rktjmp/lush.nvim",
	"mcchrish/zenbones.nvim",
}

M.config = function()
	vim.notify = require("notify")
	vim.notify.setup({})
end

return M
