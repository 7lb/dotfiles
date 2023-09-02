local M = {}

M.opts = {
	log_level = "error",
	auto_session_suppress_dirs = {
		"/",
		"~/",
		"~/Downloads",
		"~/proj",
	}
}

return M
