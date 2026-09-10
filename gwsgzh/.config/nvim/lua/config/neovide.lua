--[[ 
Neovide gui
https://neovide.dev/
https://github.com/neovide/neovide
]]--


local allModes = require('utils').allModes
local settings = require('settings')

function GuiFont(font, size)
  vim.o.guifont = string.format("%s:h%d", font, size)
end

GuiFontReset = function() GuiFont(settings.fontName, settings.fontSize) end

GuiFontReset()

local function zoom(factor)
  vim.g.neovide_scale_factor = factor and vim.g.neovide_scale_factor + factor or 1
end

-- vim.keymap.set
vim.keymap.set(allModes, "<C-=>", function() zoom(0.1) end)
vim.keymap.set(allModes, "<C-->", function() zoom(-0.1) end)

-- animations off
vim.g.neovide_position_animation_length =  0.0
vim.g.neovide_cursor_animation_length =  0.0
vim.g.neovide_cursor_trail_size =  0 
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_far_lines =  0 
vim.g.neovide_scroll_animation_length =  0
