local M = {}

M.config = function()
	vim.notify = require("notify").setup()
end

return M
