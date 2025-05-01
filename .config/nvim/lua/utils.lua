local M = {}

M.switch_bg = function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end

M.qf_dedup = function()
	local eql = function(lhs, rhs)
		return lhs ~= nil
			and rhs ~= nil
			and lhs.bufnr == rhs.bufnr
			and lhs.module == rhs.module
			and lhs.lnum == rhs.lnum
			and lhs.end_lnum == rhs.end_lnum
			and lhs.col == rhs.col
			and lhs.end_col == rhs.end_col
			and lhs.vcol == rhs.vcol
			and lhs.nr == rhs.nr
			and lhs.pattern == rhs.pattern
			and lhs.text == rhs.text
			and lhs.type == rhs.type
			and lhs.valid == rhs.valid
	end

	local unique = {}
	local it = vim.iter(vim.fn.getqflist()):each(function(e)
		local found = vim.iter(unique):any(function(x) return eql(x, e) end)
		if found then
			return
		end

		table.insert(unique, e)
	end)

	vim.fn.setqflist(unique, "r")
end

M.async_make = function()
	local makeprg = vim.api.nvim_get_option_value("makeprg", {})
	if not makeprg then
		return
	end

	local cmd = vim.fn.expandcmd(makeprg)
	local output = {}
	local on_event = function(job_id, data, event)
		if data and (event == "stdout" or event == "stderr") then
			vim.list_extend(output, data);
			return
		end

		if event == "exit" then
			vim.fn.setqflist({}, " ", {
				title = cmd,
				lines = output,
				efm = vim.api.nvim_get_option_value("errorformat", {}),
			})

			M.qf_dedup()
			vim.api.nvim_command("doautocmd QuickFixCmdPost")
			vim.cmd("botright copen")
		end
	end

	vim.fn.jobstart(
		cmd, {
			on_stdout = on_event,
			on_stderr = on_event,
			on_exit = on_event,
			stdout_buffered = true,
			stderr_buffered = true,
		}
	)
end

return M
