-- something's messed up atm

local previewer = {
  "selimacerbas/markdown-preview.nvim",
  dependencies = { "selimacerbas/live-server.nvim" },
  config = function()
    require("markdown_preview").setup({
      instance_mode = "multi",  -- "takeover" (one tab) or "multi" (tab per instance)
      port = 0,                    -- 0 = auto (8421 for takeover, OS-assigned for multi)
      open_browser = true,
      default_theme = "dark",      -- "dark" or "light"; initial preview theme
      debounce_ms = 300,
      custom_css = vim.fs.joinpath(vim.fn.stdpath('config'),vim.fs.normalize("/md/mason.css")),
      hooks = {
        on_start = function(url)
          vim.notify("Preview started: " .. url, vim.log.levels.INFO)
        end,
        on_stop = function()
          vim.notify("Preview stopped", vim.log.levels.INFO)
        end,
    },
    })
  end,
}

M = {
  previewer,
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    init = function()
      vim.g.table_mode_corner = "|"
      vim.g.table_mode_auto_align = 1
      vim.g.table_mode_auto_align_on_insert_leave = 1
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    opts = {},
  },
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", 
    opts = {
    }
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  }
}

return M
