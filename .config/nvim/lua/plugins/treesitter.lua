return {
	"nvim-treesitter/nvim-treesitter",
	main = "nvim-treesitter.configs",
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"lua",
			"markdown",
			"markdown_inline",
			"printf",
			"query",
			"regex",
			"toml",
			"vim",
			"vimdoc",
			"yaml",
			"zig",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-a>",
				node_incremental = "<C-a>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	}
}
