-- something's messed up atm

M = {
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
  },
  {
    "selimacerbas/markdown-preview.nvim",
    dependencies = { "selimacerbas/live-server.nvim" },
    config = function()
      require("markdown_preview").setup({
        -- all optional; sane defaults shown
        instance_mode = "takeover",  -- "takeover" (one tab) or "multi" (tab per instance)
        port = 0,                    -- 0 = auto (8421 for takeover, OS-assigned for multi)
        open_browser = true,
        default_theme = "dark",      -- "dark" or "light"; initial preview theme
        debounce_ms = 300,
      })
    end,
  }
}

return M
