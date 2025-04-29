local fileType = vim.api.nvim_create_augroup("fileTypeCommands", { clear = true })
local buffer = vim.api.nvim_create_augroup("bufCommands", { clear = true })
local clangFormat = vim.api.nvim_create_augroup("clangFormat", { clear = true})

-- makefiles require tabs
vim.api.nvim_create_autocmd("fileType", {
	group = fileType,
	pattern = "make",
	command = "setlocal ts=4 sts=4 sw=4 noexpandtab",
})

-- yaml requires spaces
vim.api.nvim_create_autocmd("fileType", {
	group = fileType,
	pattern = "yaml",
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})

-- enter insert mode when switching to a terminal window
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	group = buffer,
	pattern = "term://*",
	command = "startinsert",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.inl" },
	callback = function()
		vim.o.foldmethod = "expr"
		vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end
})

-- trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})
