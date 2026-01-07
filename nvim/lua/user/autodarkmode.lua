local auto_dark_mode = require('auto-dark-mode')
local transparent = require('user.transparent')

auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		transparent.set_transparent_bg()
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		transparent.set_transparent_bg()
	end,
})
auto_dark_mode.init()