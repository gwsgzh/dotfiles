settings = require('settings')

vim.cmd('colorscheme ' .. settings.colorscheme)

vim.o.background = "dark"

vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#00ff00", fg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "htmlBold", { fg = "#ffff00", bold = true })
