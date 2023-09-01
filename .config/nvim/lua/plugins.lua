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

require("lazy").setup({
	{
		"neovim/nvim-lspconfig",
		opts = require("pluginconfig.clangd")
	},
})

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	use "neovim/nvim-lspconfig"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip"
	use "L3MON4D3/LuaSnip"
	use "nvim-tree/nvim-web-devicons"
	use "folke/trouble.nvim"
	use "nvim-lua/plenary.nvim"
	use "RRethy/vim-illuminate"
	use "akinsho/toggleterm.nvim"
	use "tpope/vim-repeat"
	use "ggandor/leap.nvim"
	use "klen/nvim-config-local"
	use "stevearc/dressing.nvim"
	use "rcarriga/nvim-notify"
	use "rktjmp/lush.nvim"
	use "Weissle/persistent-breakpoints.nvim"
	use "rmagatti/auto-session"
	use "konradmagnusson/larry"

	-- treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({
				with_sync = true
			})
			ts_update()
		end,
	}
	use "nvim-treesitter/playground"

	-- telescope
	use {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { "nvim-lua/plenary.nvim" },
	}
	use "FeiyouG/command_center.nvim"

	-- dap
	use "mfussenegger/nvim-dap"
	use "theHamsta/nvim-dap-virtual-text"
	use {
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
