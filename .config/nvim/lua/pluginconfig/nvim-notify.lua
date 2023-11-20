local M = {}

M.config = function()
	vim.notify = require("notify")
	vim.notify.setup({})
end

return M
