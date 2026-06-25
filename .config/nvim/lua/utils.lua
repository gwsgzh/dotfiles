local M = {}

M.allModes = {"n", "v", "i", "c" ,"t"}

-- get file content
function M.readfile(path)
  if vim.fn.filereadable(path) == 1 then
        local file = io.open(path, "r") 
        local content = file:read("*all") -- Read entire content
        file:close()
        return content
  else
    return -1
  end
end


-- get specific file in stdpath('config')
function M.fileIC(file)
  return vim.fs.joinpath(vim.fn.stdpath("config"), file) 
end

-- inspect objects
function M.inspect(obj) 
  print(vim.inspect(obj))
end

return M

