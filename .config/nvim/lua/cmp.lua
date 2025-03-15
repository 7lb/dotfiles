local function pum_remap(lhs, rhs)
	return vim.fn.pumvisible() == 1 and lhs or rhs
end

local pum_funcs = {
	["<tab>"] = function() return pum_remap("<C-n>", "<tab>") end,
	["<S-tab>"] = function() return pum_remap("<C-p>", "<S-tab>") end,
	["<esc>"] = function() return pum_remap("<C-e>", "<esc>") end,
	["<cr>"] = function() return pum_remap("<C-y>", "<cr>") end,
}

vim.keymap.set("i", "<C-space>", "<C-x><C-o>")
vim.keymap.set("i", "<tab>", pum_funcs["<tab>"], { expr = true })
vim.keymap.set("i", "<S-tab>", pum_funcs["<S-tab>"], { expr = true })
vim.keymap.set("i", "<esc>", pum_funcs["<esc>"], { expr = true })
vim.keymap.set("i", "<cr>", pum_funcs["<cr>"], { expr = true })
