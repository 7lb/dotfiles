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
--
-- enter insert mode when switching to a terminal window
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	group = buffer_gorup,
	pattern = "term://*",
	command = "startinsert",
})
