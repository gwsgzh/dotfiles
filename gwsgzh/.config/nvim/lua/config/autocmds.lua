vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  desc = "Disable automatic addition of comments when linebreaking",
})


vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.hl.on_yank() end
})
