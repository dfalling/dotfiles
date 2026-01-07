local M = {}

function M.set_transparent_bg()
	vim.cmd([[
		highlight Normal guibg=NONE ctermbg=NONE
		highlight NonText guibg=NONE ctermbg=NONE
		highlight NormalNC guibg=NONE ctermbg=NONE
	]])
end

return M
