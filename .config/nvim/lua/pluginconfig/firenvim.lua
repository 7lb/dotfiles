local M = { 'glacambre/firenvim' }

M.lazy = not vim.g.started_by_firenvim

M.build = ":call firenvim#install(0)"

return M
