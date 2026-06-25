return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', 'ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', 'fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n','fc', builtin.command_history, { desc = 'Telescope command history' } )
      vim.keymap.set('n','fo', builtin.oldfiles, { desc = 'Telescope old files' } )
    end
  },
}
