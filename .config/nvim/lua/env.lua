--[[
env.json structure:
{
  linux: { k: v, ...},
  windows: { k: v, ...}
}
]]--

local u = require('utils')

local ENV_FILENAME = "env.json"
local ENV_KEY_FORMAT = "__mason_%s"
local OS = vim.fn.has('unix') and 'linux' or 'windows'

local function getMasonEnvs()
  local raw = u.readfile(u.fileIC(ENV_FILENAME))
  if raw == -1 then
    u.msg("couldn't set envs", vim.log.levels.WARN, 1)
    return -1
  end

  local t = vim.json.decode(raw)
  
  if t == nil then 
    u.msg("couldn't decode env.json.", vim.log.levels.WARN, 1)
    return -1 
  end

  local mkv = {}
   
  for k, v in pairs(t[OS]) do
    mkv[string.format(ENV_KEY_FORMAT, k)] = vim.fs.normalize(v)
  end

  return mkv;
end

local envs =  getMasonEnvs()

-- Couldn't set envs
if envs == -1 then
    u.msg("couldn't set envs.", vim.log.levels.WARN, 1)
  return
end

local function setMasonEnvs(envs) 
  local c = {}

  for k, v in pairs(envs) do
    vim.env[k] = v
    table.insert(c, k)
  end

  local msg = string.format("added %d envs: [%s]. Access with $__mason_ENVNAME.", #c, table.concat(c, ", "))

  u.msg(msg, vim.log.levels.INFO, 1)
end

setMasonEnvs(envs)

vim.api.nvim_create_user_command("RefreshEnvs", setMasonEnvs, {nargs = 0})
vim.api.nvim_create_user_command("ShowEnvs", function() u.inspect(envs) end, {nargs = 0})
