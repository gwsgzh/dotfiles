-- root init.lua
-- @leaders and debug
-- @Options
-- @Keymaps
-- @Statusline
-- @Terminal

-- @Leaders
vim.g.mapleader = ";"
vim.g.localmapleader = ";"

-- Debug
-- <Leader>e to edit $MYVIMRC
vim.cmd("set autochdir")
vim.o.visualbell = true

vim.keymap.set("n", "<Leader>e", ":e $MYVIMRC<CR>", { desc = "Edits init file of the config"} )
vim.keymap.set("n", "<Leader>s", ":source<CR>", { desc = "Sources current lua file" })


-- @Options
vim.o.timeoutlen = 1000
vim.o.backup = true
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


-- vim.o.backupdir = vim.fn.expand("~/.neovim/backups/")
-- vim.o.undodir = vim.fn.expand("~/.neovim/undo/")
-- vim.o.directory = vim.fn.expand("~/.neovim/swp/")

-- @Keymaps 

keymaps = {
  -- jj to escape
  {"i", "jj", "<Esc>", { desc = "Escapes to normal mode" }},

  -- <Leader>w and q to save and quit respectively
  {"n", "<Leader>w", ":w!<CR>", { desc = "Saves buffer" } },
  {"n", "<Leader>q", ":q<CR>", { desc = "Closes buffer" } },
  {"n", "<Leader>Q", ":quitall<CR>", { desc = "Quits neovim" } },

  -- Tab controls
  {"n", ",,", ":tabnew<CR>", { desc = "Opens a new tab" } },
  {"n", "+", ":tablast<CR>", { desc = "Goes to last tab" } },
  {"n", "_", ":tabfirst<CR>", { desc = "Goes to first tab" } },
  {"n", "-", ":tabprevious<CR>", { desc = "Goes to previous tab" } },
  {"n", "=", ":tabnext<CR>", { desc = "Goes to next tab" } },

  -- Resize splits with Ctrl + arrows,
  {"n", "<C-Up>", ":resize +1<CR>", { desc = "Resize vsplit +1" } },
  {"n", "<C-Down>", ":resize -1<CR>", { desc = "Resize vsplit -1" } },
  {"n", "<C-Right>", ":vertical resize +1<CR>", { desc = "Resize hsplit +1"}},
  {"n", "<C-Left>", ":vertical resize -1<CR>", { desc = "Resize hsplit -1"} },

  {"n", "<Leader>bd", "bufdo bd!", { desc = "Close all buffers except current one" }}
}

for _, keymap in ipairs(keymaps) do 
  vim.keymap.set(unpack(keymap))
end

-- @Statusline

Statusline = {}

Statusline.format = {
  padding = "",
  user = vim.fn.expand("$USER"),
  file = "%F",
  filetype = "%Y",
  modified = "%m",
  splitter = "%=",
  lines = "(%l/%L)",
  mode = function() return vim.fn.mode() end

}

Statusline.short = function()
  return table.concat({
    Statusline.format.padding,
    Statusline.format.mode(),
    Statusline.format.file,
    Statusline.format.filetype,
    Statusline.format.padding,
  }, " ")
end

Statusline.default = function()
  return table.concat({
    Statusline.format.padding,
    Statusline.format.user,
    Statusline.format.mode(),
    Statusline.format.file,
    Statusline.format.filetype,
    Statusline.format.lines,
    Statusline.format.modified,
    Statusline.format.splitter,
    os.date('%c'),
    Statusline.format.padding,
  }, " ")
end

vim.o.laststatus = 2
vim.o.showmode = false

vim.api.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
  pattern = "*",
  callback = function()
    vim.opt_local.statusline = "%!v:lua.Statusline.default()"
  end
})

vim.api.nvim_create_autocmd({"TermEnter", "TermOpen"}, {
  pattern = "*",
  callback = function()
    vim.opt_local.statusline = "%!v:lua.Statusline.short()"
  end
})

-- @Terminal
-- Set shell as pwsh if on windows

-- Terminal mode escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal mode escape" } )
vim.keymap.set("n", "<Leader>T", ":term<CR>", { desc = "Opens terminal" })

vim.api.nvim_create_autocmd({"TermOpen","TermEnter"},{
  pattern = "*",
  command = "setlocal nonumber norelativenumber"
})

-- Reset statusline when exiting terminal
vim.api.nvim_create_autocmd({"TermClose","TermLeave"},{
  pattern = "*",
  command = "set statusline=%!v:lua.Statusline.default()"
})
