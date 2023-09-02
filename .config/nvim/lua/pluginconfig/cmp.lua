local M = {}

M.config = function()
	local cmp = require("cmp")
	cmp.setup({
		mapping = {
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<Esc>"] = cmp.mapping(function()
					cmp.mapping.abort()
					vim.cmd("stopinsert")
			end),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
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
