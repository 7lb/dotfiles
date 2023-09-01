-- colors
vim.cmd("syntax on")
vim.o.background = "dark"
vim.o.termguicolors = true

-- default indentation is 4-wide tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false

-- show tabs and trailing whitespace
vim.o.list = true
vim.opt.listchars = { tab = "> ", trail = "·" }

-- 80 usable
vim.o.colorcolumn = "81"

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.foldmethod = "indent"
vim.o.foldlevel = 99

vim.o.number = true
vim.o.relativenumber = false

vim.o.cursorline = true
vim.o.hidden = true

vim.go.autoread = true
vim.opt.ignorecase = true
