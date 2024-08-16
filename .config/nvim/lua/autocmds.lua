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

-- automatically close quickfix window and location lists when selecting entry
--vim.api.nvim_create_autocmd("fileType", {
--	group = fileType,
--	pattern = "qf",
--	command = "nnoremap <buffer> <CR> <CR>:cclose<CR>",
--})

-- enter insert mode when switching to a terminal window
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	group = buffer,
	pattern = "term://*",
	command = "startinsert",
})

-- format C or C++ files with clang-format on save
-- Note: suffix list taken from the gcc online manual
vim.api.nvim_create_autocmd("BufWritePost", {
	group = clangFormat,
	pattern = {
		"*.c", "*.cc", "*.cp", "*.cxx", "*.cpp", "*.CPP", "*.c++", "*.C",
		"*.h", "*.hh", "*.hp", "*.hxx", "*.hpp", "*.HPP", "*.h++", "*.H",
	},

	command = "silent !clang-format -i %:p",
})

vim.api.nvim_create_autocmd({ "UIEnter" }, {
	callback = function(event)
		local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
		if client ~= nil and client.name == "Firenvim" then
			vim.o.laststatus = 0
			vim.o.lines = 30
			vim.o.columns = 80
		end
	end
})
