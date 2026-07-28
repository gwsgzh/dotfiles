-- Options

vim.cmd('colorscheme qmason')
vim.o.background = "dark"


vim.o.timeoutlen = 1000
vim.o.backup = true
vim.o.backupdir = vim.fn.expand("~/.neovim/backups/")
vim.o.undodir = vim.fn.expand("~/.neovim/undo/")
vim.o.directory = vim.fn.expand("~/.neovim/swp/")
vim.o.number = true
vim.o.wrap = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.signcolumn = "number"
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.wildmenu = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.opt.fileformats = { "unix", "dos" }

vim.cmd [[
  filetype indent plugin on
  syntax on
]]

vim.o.encoding = "utf-8"
