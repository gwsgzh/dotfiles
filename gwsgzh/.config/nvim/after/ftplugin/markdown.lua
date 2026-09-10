local rm = require('render-markdown')

vim.keymap.set({"n", "i"}, "<C-e>", rm.buf_toggle, { desc = "toggles render-markdown for the current buffer", buffer = true, silent = true })

vim.keymap.set("n", "<leader>tm", ":TableModeToggle<CR>")
vim.keymap.set("n", "<leader>tr", ":TableModeRealign<CR>")

