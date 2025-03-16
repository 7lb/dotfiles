vim.g.mapleader = ","

-- delete default keybinds that conflict wit custom
vim.keymap.del("n", "gcc"); -- comment line

-- easier split navigation
vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-k>", "<C-w>k")
vim.keymap.set("", "<C-l>", "<C-w>l")

-- easier copy paste
vim.keymap.set("n", "<Leader>y", "\"+y")
vim.keymap.set("n", "<Leader>p", "\"+p")

-- easy escape from terminal windows
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- auto-escape when moving away from a terminal window
-- recursive maps so they map to the remapped <Esc> and <C-*> shortcuts
vim.keymap.set("t", "<C-h>", "<Esc><C-h>", { remap = true })
vim.keymap.set("t", "<C-j>", "<Esc><C-j>", { remap = true })
vim.keymap.set("t", "<C-k>", "<Esc><C-k>", { remap = true })
vim.keymap.set("t", "<C-l>", "<Esc><C-l>", { remap = true })

-- quickfix window
vim.keymap.set("n", "gf", ":try | cnext | catch | cfirst | catch | endtry<cr>")
vim.keymap.set("n", "gF", ":try | cprev | catch | clast | catch | endtry<cr>")
vim.keymap.set("n", "<leader>fo", ":copen<cr>")
vim.keymap.set("n", "<leader>fc", ":cclose<cr>")
vim.keymap.set("n", "<leader>fx", ":cexpr [] | cclose<cr>")

-- diagnostics
vim.keymap.set("n", "ge", vim.diagnostic.goto_next)
vim.keymap.set("n", "gE", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
