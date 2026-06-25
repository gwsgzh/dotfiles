-- very primitive for now

local u = require('utils')

ENV_FILENAME = "env.json"
ENV_KEY_FORMAT = "__mason_%s"

local function getMasonEnvs()
  local raw = u.readfile(u.fileIC(ENV_FILENAME))
  if raw == -1 then
    vim.notify("[mason.lua] couldn't set envs.", vim.log.levels.WARN)
    return
  end

  local t = vim.json.decode(raw) 
  local mkv = {}

  for k, v in pairs(t) do
    mkv[string.format(ENV_KEY_FORMAT, k)] = vim.fs.normalize(v)
  end

  return mkv;
end

local envs =  getMasonEnvs()

local function setMasonEnvs(envs) 
  local c = {}
  for k, v in pairs(envs) do
    vim.env[k] = v
    table.insert(c, k)
  end
  local fmt = "[env.lua] added %d envs: [%s]. Access with $__mason_ENVNAME."
  vim.notify(string.format(fmt, #c, table.concat(c, ", "), vim.log.levels.INFO))
end

setMasonEnvs(envs)

vim.api.nvim_create_user_command("RefreshEnvs", setMasonEnvs, {nargs = 0})
vim.api.nvim_create_user_command("ShowEnvs", function() u.inspect(envs) end, {nargs = 0})
