-- colors
vim.cmd("syntax on")
vim.o.background = "dark"
vim.o.termguicolors = true
vim.cmd("colorscheme no-clown-fiesta")

-- default indentation is 4-wide tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false

-- show tabs, trailing whitespace, and newlines
vim.o.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·" }

-- 80 usable
vim.o.colorcolumn = "81"

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.foldlevel = 99

vim.o.number = true
vim.o.relativenumber = false

vim.o.hidden = true
