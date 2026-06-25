return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = {
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "python"
    }
  }
}

