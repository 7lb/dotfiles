local file_type_group = vim.api.nvim_create_augroup("fileTypeCommands", { clear = true })
local buffer_group = vim.api.nvim_create_augroup("bufCommands", { clear = true })

-- makefiles require tabs
vim.api.nvim_create_autocmd("fileType", {
	group = file_type_group,
	pattern = "make",
	command = "setlocal ts=4 sts=4 sw=4 noexpandtab",
})

-- yaml requires spaces
vim.api.nvim_create_autocmd("fileType", {
	group = file_type_group,
	pattern = "yaml",
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})

-- automatically close quickfix window and location lists when selecting entry
--vim.api.nvim_create_autocmd("fileType", {
--	group = file_type_group,
--	pattern = "qf",
--	command = "nnoremap <buffer> <CR> <CR>:cclose<CR>",
--})

-- enter insert mode when switching to a terminal window
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	group = buffer_group,
	pattern = "term://*",
	command = "startinsert",
})

-- format C or C++ files with clang-format on save
-- Note: suffix list taken from the gcc online manual
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = {
		"*.c", "*.cc", "*.cp", "*.cxx", "*.cpp", "*.CPP", "*.c++", "*.C",
		"*.h", "*.hh", "*.hp", "*.hxx", "*.hpp", "*.HPP", "*.h++", "*.H",
	},

	command = "silent !clang-format -i %:p",
})

-- load session associated with cwd when starting nvim without a file
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function(event)
		local bufName = vim.api.nvim_buf_get_name(0)
		if bufName == nil or bufName == "" then
			require("persistence").load()
		end
	end
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
