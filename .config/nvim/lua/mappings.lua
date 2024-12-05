local nvim_set_keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","

-- easier split navigation
nvim_set_keymap("", "<C-h>", "<C-w>h", { noremap = true })
nvim_set_keymap("", "<C-j>", "<C-w>j", { noremap = true })
nvim_set_keymap("", "<C-k>", "<C-w>k", { noremap = true })
nvim_set_keymap("", "<C-l>", "<C-w>l", { noremap = true })

-- tabs
nvim_set_keymap("n", "ta", ":tabnew<CR>", { noremap = true })
nvim_set_keymap("n", "ti", ":-tabnew<CR>", { noremap = true })
nvim_set_keymap("n", "tA", ":$tabnew<CR>", { noremap = true })
nvim_set_keymap("n", "tI", ":0tabnew<CR>", { noremap = true })
nvim_set_keymap("n", "tx", ":tabclose<CR>", { noremap = true })
nvim_set_keymap("n", "tX", ":tabonly<CR>", { noremap = true })
nvim_set_keymap("n", "tn", ":tabnext<CR>", { noremap = true })
nvim_set_keymap("n", "tN", ":tabprevious<CR>", { noremap = true })

-- easier copy paste
nvim_set_keymap("n", "<Leader>y", "\"+y", { noremap = true })
nvim_set_keymap("n", "<Leader>p", "\"+p", { noremap = true })

-- easy escape from terminal windows
nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- auto-escape when moving away from a terminal window
-- recursive maps so they map to the remapped <Esc> and <C-*> shortcuts
nvim_set_keymap("t", "<C-h>", "<Esc><C-h>", {})
nvim_set_keymap("t", "<C-j>", "<Esc><C-j>", {})
nvim_set_keymap("t", "<C-k>", "<Esc><C-k>", {})
nvim_set_keymap("t", "<C-l>", "<Esc><C-l>", {})

-- code navigation: show diagnostics in a float
local open_float = "<CMD>lua vim.diagnostic.open_float()<CR>"
nvim_set_keymap("n", "gf", open_float, { noremap = true })
