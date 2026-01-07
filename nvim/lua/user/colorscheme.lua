local colorscheme = "catppuccin"
local transparent = require("user.transparent")

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
vim.opt.background = "light"

-- Make background transparent to use shell background color
transparent.set_transparent_bg()