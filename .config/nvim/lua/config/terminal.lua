-- Set shell as pwsh if on windows
if vim.fn.has("win64") == 1 then
  vim.cmd[[
  set shell=pwsh.exe
  set shellxquote=
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
  let &shellquote   = ''
  let &shellpipe    = '| Out-File -Encoding UTF8 %s'
  let &shellredir   = '| Out-File -Encoding UTF8 %s'
  ]]
end

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
