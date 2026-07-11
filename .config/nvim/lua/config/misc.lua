local msg = require('utils').msg

vim.api.nvim_create_user_command("CopyPWD", function()
  vim.fn.setreg('+', vim.fn.getcwd())
  msg("copied working directory path to clipboard", vim.log.levels.INFO, true)
end, {nargs = 0})

