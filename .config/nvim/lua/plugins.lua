local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = true,
	}, {
		"hrsh7th/cmp-nvim-lsp",
	}, {
		"hrsh7th/nvim-cmp",
		config = require("pluginconfig.cmp").config,
	}, {
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = require("pluginconfig.lsp").config,
	}, {
		"FeiyouG/commander.nvim",
		init = require("pluginconfig.commander").init,
		opts = require("pluginconfig.commander").opts,
	}, {
		"mfussenegger/nvim-dap",
		config = require("pluginconfig.dap").config,
	}, {
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
	}, {
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
			"rktjmp/lush.nvim",
			"mcchrish/zenbones.nvim",
		},
		init = require("pluginconfig.dap-ui").init,
		opts = require("pluginconfig.dap-ui").opts,
	}, {
		"nvim-tree/nvim-web-devicons",
	}, {
		"stevearc/dressing.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = require("pluginconfig.dressing").config,
	--}, {
	--	"konradmagnusson/larry",
	}, {
		"ggandor/leap.nvim",
		init = require("pluginconfig.leap").init,
	}, {
		"rktjmp/lush.nvim",
		--config = require("pluginconfig.lush").config,
	}, {
		"mcchrish/zenbones.nvim",
		config = require("pluginconfig.zenbones").config,
	}, {
		"klen/nvim-config-local",
		dependencies = { "rcarriga/nvim-notify" },
		opts = require("pluginconfig.nvim-config-local").opts,
	}, {
		"rcarriga/nvim-notify",
		dependencies = {
			"rktjmp/lush.nvim",
			"mcchrish/zenbones.nvim",
		},
		config = require("pluginconfig.nvim-notify").config,
	}, {
		"Weissle/persistent-breakpoints.nvim",
		opts = require("pluginconfig.persistent-breakpoints").opts,
	}, {
		"nvim-lua/plenary.nvim",
	}, {
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"FeiyouG/commander.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = require("pluginconfig.telescope").config,
		opts = require("pluginconfig.telescope").opts,
	}, {
		"akinsho/toggleterm.nvim",
		opts = require("pluginconfig.toggleterm").opts,
	}, {
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-lspconfig" },
		main = "nvim-treesitter.configs",
		opts = require("pluginconfig.treesitter").opts,
		build = ":TSUpdate",
	}, {
		"folke/trouble.nvim",
		opts = require("pluginconfig.trouble").opts,
	}, {
		"RRethy/vim-illuminate",
	}, {
		"tpope/vim-repeat",
	}, {
		"sindrets/diffview.nvim",
	}, {
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim",
			"rktjmp/lush.nvim",
			"mcchrish/zenbones.nvim",
		},
		config = true,
	}, {
		"lewis6991/gitsigns.nvim",
		opts = require("pluginconfig.gitsigns").opts,
	}, {
		'glacambre/firenvim',
		lazy = not vim.g.started_by_firenvim,
		build = ":call firenvim#install(0)",
	}, {
		dir = "/home/proj/nvim-cwscript",
		dependencies = {
			"nvim-treesitter/nvim-treesitter"
		},
		opts = {
			ts_parser_path = "/home/proj/tree-sitter-cwscript"
		}
	}, {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
}})
