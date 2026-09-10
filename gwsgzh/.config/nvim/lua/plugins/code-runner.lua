-- https://github.com/CRAG666/code_runner.nvim
return {
  "CRAG666/code_runner.nvim",
  init = function() vim.keymap.set("n", ";;", ":RunCode<CR>", { desc = "Runs code_runner" }) end,
  opts = {
    mode = "float",
    filetype= {
      lua = "lua $fileName",
      ps1 = "pwsh -File $fileName",
      perl = "perl $fileName",
      php = "php $fileName"
    },
    float = {
      border = "rounded",
    }
  }
}
