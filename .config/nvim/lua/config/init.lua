local modules =
{
  "options",
  "autocmds",
  "mappings",
  "statusline",
  "terminal",
}

for _, module in ipairs(modules) do
   require("config." .. module)
end


if vim.g.neovide then
  require("config.neovide")
end

