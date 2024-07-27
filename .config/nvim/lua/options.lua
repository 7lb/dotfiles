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

vim.opt.sessionoptions = {
	"blank",
	"curdir",
	"folds",
	"globals",
	"help",
	"options",
	"resize",
	"tabpages",
	"winpos",
	"winsize",
}

vim.g.firenvim_config = {
	globalSettings = { alt = "all" },
	localSettings = {
		[".*"] = {
			cmdline  = "neovim",
			content  = "text",
			priority = 0,
			selector = "textarea",
			takeover = "never"
		}
	}
}
