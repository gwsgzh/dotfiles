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
