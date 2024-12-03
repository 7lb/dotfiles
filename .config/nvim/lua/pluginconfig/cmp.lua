local M = { "hrsh7th/nvim-cmp" }

M.config = function()
	local cmp = require("cmp")
	cmp.setup({
		mapping = {
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<Esc>"] = cmp.mapping(function()
					cmp.mapping.abort()
					vim.cmd("stopinsert")
			end),
			["<CR>"] = cmp.mapping(function(fallback)
				if not cmp.visible() then
					fallback()
					return
				end

				local active = cmp.get_active_entry()
				if active then
					cmp.close()
					return
				end

				local selected = cmp.get_selected_entry()
				if selected then
					cmp.close()
					return
				end

				cmp.select_next_item()
				vim.schedule(function() cmp.close() end)
			end),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end),
		},

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
		}),
	})
end

return M
