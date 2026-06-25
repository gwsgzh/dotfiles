keymaps = {
  -- jj to escape
  {"i", "jj", "<Esc>", { desc = "Escapes to normal mode" }},

  -- <Leader>w and q to save and quit respectively
  {"n", "<Leader>w", ":w!<CR>", { desc = "Saves buffer" } },
  {"n", "<Leader>q", ":q<CR>", { desc = "Closes buffer" } },
  {"n", "<Leader>Q", ":quitall<CR>", { desc = "Quits neovim" } },

  -- Tab controls
  {"n", ",,", ":tabnew<CR>", { desc = "Opens a new tab" } },
  {"n", "+", ":tablast<CR>", { desc = "Goes to last tab" } },
  {"n", "_", ":tabfirst<CR>", { desc = "Goes to first tab" } },
  {"n", "-", ":tabprevious<CR>", { desc = "Goes to previous tab" } },
  {"n", "=", ":tabnext<CR>", { desc = "Goes to next tab" } },

  -- Inserts date,
  {"n", "<Leader>d", "a<C-R>=strftime('%c')<CR><Esc>", { desc = "Inserts date and time" }},

  -- Resize splits with Ctrl + arrows,
  {"n", "<C-Up>", ":resize +1<CR>", { desc = "Resize vsplit +1" } },
  {"n", "<C-Down>", ":resize -1<CR>", { desc = "Resize vsplit -1" } },
  {"n", "<C-Right>", ":vertical resize +1<CR>", { desc = "Resize hsplit +1"}},
  {"n", "<C-Left>", ":vertical resize -1<CR>", { desc = "Resize hsplit -1"} },

  {"n", "<Leader>bd", "bufdo bd!", { desc = "Close all buffers except current one" }}
}

for _, keymap in ipairs(keymaps) do 
  vim.keymap.set(unpack(keymap))
end

