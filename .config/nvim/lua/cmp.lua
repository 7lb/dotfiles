local function pum_remap(lhs, rhs)
	return vim.fn.pumvisible() == 1 and lhs or rhs
end

local pum_funcs = {
	["<esc>"] = function() return pum_remap("<C-e>", "<esc>") end,
}

vim.keymap.set("i", "<C-n>", function() vim.lsp.completion.get() end)
vim.keymap.set("i", "<esc>", pum_funcs["<esc>"], { expr = true })
