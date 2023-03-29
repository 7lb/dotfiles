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

-- easy escape from terminal windows
nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- auto-escape when moving away from a terminal window
-- recursive maps so they map to the remapped <Esc> and <C-*> shortcuts
nvim_set_keymap("t", "<C-h>", "<Esc><C-h>", {})
nvim_set_keymap("t", "<C-j>", "<Esc><C-j>", {})
nvim_set_keymap("t", "<C-k>", "<Esc><C-k>", {})
nvim_set_keymap("t", "<C-l>", "<Esc><C-l>", {})

-- telescope
local cmd_center = "<CMD>Telescope command_center<CR>"
local find_files = "<CMD>Telescope find_files<CR>"

nvim_set_keymap("n", "<C-m>", cmd_center, { noremap = true })
nvim_set_keymap("n", "<C-p>", find_files, { noremap = true })

-- dap
local dap_toggle_breakpoint = "<CMD>lua require('dap').toggle_breakpoint()<CR>"
local dap_continue = "<CMD>lua require('dap').continue()<CR>"
local dap_step_over = "<CMD>lua require('dap').step_over()<CR>"
local dap_step_into = "<CMD>lua require('dap').step_into()<CR>"
local dap_step_out = "<CMD>lua require('dap').step_out()<CR>"
local dap_repl = "<CMD>lua require('dap').repl.open()<CR>"

nvim_set_keymap("n", "<Leader>db", dap_toggle_breakpoint, { noremap = true })
nvim_set_keymap("n", "<Leader>dc", dap_continue, { noremap = true })
nvim_set_keymap("n", "<Leader>ds", dap_step_over, { noremap = true })
nvim_set_keymap("n", "<Leader>di", dap_step_into, { noremap = true })
nvim_set_keymap("n", "<Leader>do", dap_step_out, { noremap = true })
nvim_set_keymap("n", "<Leader>dr", dap_repl, { noremap = true })
