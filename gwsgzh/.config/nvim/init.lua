-- python3 isn't recognized in windows for some reason unless this is set
if vim.fn.has('win64') then
  vim.g.python3_host_prog = 'py'
end

-- leaders
vim.g.mapleader = ";"
vim.g.localmapleader = ";"

-- Debug
-- <Leader>e to edit $MYVIMRC
vim.cmd("set autochdir")
vim.o.visualbell = true

vim.keymap.set("n", "<Leader>e", ":e $MYVIMRC<CR>", { desc = "Edits init file of the config"} )
vim.keymap.set("n", "<Leader>s", ":source<CR>", { desc = "Sources current lua file" })

-- Bootstrap lazy package manager
require('initlazy')

-- Actual config
require('config')

-- set vim envs for directories
require('env')
