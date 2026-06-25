-- https://github.com/stevearc/oil.nvim
return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.o.autochdir = true
    vim.keymap.set("n", "<Leader>ff", "<CMD>Oil<CR>", { desc = "Opens Oil" })
  end,
  config = function()
    require("oil").setup{
      default_file_explorer = true,
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      keymaps = {
      ["-"] = false,
      ["0"] = { "actions.parent", mode = "n" },
      }
  }
  end
}
