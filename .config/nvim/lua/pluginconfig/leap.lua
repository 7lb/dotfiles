local M = {}

M.init = function()
	local leap = require("leap")
	leap.add_default_mappings()
end

return M
