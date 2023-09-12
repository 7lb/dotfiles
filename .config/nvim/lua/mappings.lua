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

-- telescope
local cmd_center = "<CMD>Telescope commander<CR>"
local find_files = "<CMD>Telescope find_files<CR>"

nvim_set_keymap("n", "<A-p>", cmd_center, { noremap = true })
nvim_set_keymap("n", "<C-p>", find_files, { noremap = true })

-- dap
local dap_toggle_breakpoint = "<CMD>lua require('persistent-breakpoints.api').toggle_breakpoint()<CR>"
local dap_set_logpoint = "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Msg: '))<CR>"
local dap_continue = "<CMD>lua require('dap').continue()<CR>"
local dap_step_over = "<CMD>lua require('dap').step_over()<CR>"
local dap_step_into = "<CMD>lua require('dap').step_into()<CR>"
local dap_step_out = "<CMD>lua require('dap').step_out()<CR>"
local dap_repl = "<CMD>lua require('dap').repl.open()<CR>"
local dap_up = "<CMD>lua require('dap').up()<CR>"
local dap_down = "<CMD>lua require('dap').down()<CR>"
local dap_eval = "<CMD>lua require('dapui').eval()<CR>"

nvim_set_keymap("n", "<Leader>db", dap_toggle_breakpoint, { noremap = true })
nvim_set_keymap("n", "<Leader>dl", dap_set_logpoint, { noremap = true })
nvim_set_keymap("n", "<Leader>dc", dap_continue, { noremap = true })
nvim_set_keymap("n", "<Leader>ds", dap_step_over, { noremap = true })
nvim_set_keymap("n", "<Leader>di", dap_step_into, { noremap = true })
nvim_set_keymap("n", "<Leader>do", dap_step_out, { noremap = true })
nvim_set_keymap("n", "<Leader>dr", dap_repl, { noremap = true })
nvim_set_keymap("n", "<Leader>dj", dap_up, { noremap = true })
nvim_set_keymap("n", "<Leader>dk", dap_down, { noremap = true })
nvim_set_keymap("n", "<Leader>de", dap_eval, { noremap = true })

-- larry
local larry_select_preset = "<CMD>lua require('larry').SelectPreset()<CR>"
local larry_configure = "<CMD>lua require('larry').Configure()<CR>"
local larry_build = "<CMD>lua require('larry').Build()<CR>"
local larry_toggle_configure_view = "<CMD>lua require('larry').ToggleConfigureView()<CR>"
local larry_toggle_build_view = "<CMD>lua require('larry').ToggleBuildView()<CR>"

nvim_set_keymap("n", "<Leader>lp", larry_select_preset, { noremap = true })
nvim_set_keymap("n", "<Leader>lc", larry_configure, { noremap = true })
nvim_set_keymap("n", "<Leader>lb", larry_build, { noremap = true })
nvim_set_keymap("n", "<Leader>lC", larry_toggle_configure_view, { noremap = true })
nvim_set_keymap("n", "<Leader>lB", larry_toggle_build_view, { noremap = true })
