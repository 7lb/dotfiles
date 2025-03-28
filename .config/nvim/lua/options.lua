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

-- 80, 120 usable
vim.o.colorcolumn = "81,121"
vim.o.signcolumn = "yes"

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 10

vim.o.foldenable = true
vim.o.foldlevel = 99

vim.o.number = true
vim.o.relativenumber = false

vim.o.cursorline = true
vim.o.hidden = true

vim.go.autoread = true
vim.o.ignorecase = true

vim.o.undofile = true
vim.opt.shortmess = vim.opt.shortmess + "c"

vim.o.pumheight = 15
vim.opt.completeopt = {
	"menuone",
	"noselect",
	"popup",
	"fuzzy",
}

vim.opt.sessionoptions = {
	"blank",
	"curdir",
	"folds",
	"globals",
	"help",
	"options",
	"tabpages",
	"winsize",
}

vim.diagnostic.config({ virtual_text = true })
