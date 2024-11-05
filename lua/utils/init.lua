-- Utils
local M = {}

-- Buffer number
M.stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

-- LSP
M.lsp = function()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if client.attached_buffers[M.stbufnr()] then
        return (vim.o.columns > 100 and "   LSP ~ " .. client.name .. " ") or "   LSP "
      end
    end
  end

  return ""
end

M.fun = function(t)
  local f = t[1]
  local args = { unpack(t, 2) }
  return function()
    return f(unpack(args))
  end
end

M.fn = function(f, ...)
  local args = { ... }
  return function(...)
    return f(unpack(args), ...)
  end
end

--- Function to merge/join tables
--- @param ... table List of tables to be merged
--- @return table Merged
M.MergeTables = function(...)
  local result = {}

  for i, tbl in ipairs { ... } do
    for k, v in pairs(tbl) do
      if type(k) ~= "number" then
        result[k] = v
      else
        table.insert(result, v)
      end
    end
  end

  return result
end

--- Function to check if value is in table
--- @param table table
--- @param value any
--- @return boolean
M.TableContents = function(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

--- Function to recursively merge/join tables
--- @param into table
--- @param from table
--- @return table
M.RecursiveMerge = function(into, from)
  local stack = {}
  local node1 = into
  local node2 = from
  while true do
    for k, v in pairs(node2) do
      if type(v) == "table" and type(node1[k]) == "table" then
        table.insert(stack, { node1[k], node2[k] })
      else
        node1[k] = v
      end
    end
    if #stack > 0 then
      local t = stack[#stack]
      node1, node2 = t[1], t[2]
      stack[#stack] = nil
    else
      break
    end
  end
  return into
end

-- Function to check if a CMP source is available
-- @param name string
-- @return boolean
M.cmpSource = function(name)
  local started = false
  if not package.loaded["cmp"] then
    return
  end
  for _, s in ipairs(require("cmp").core.sources) do
    if s.name == name then
      if s.source:is_available() then
        started = true
      else
        return started and "error" or nil
      end
      if s.status == s.SourceStatus.FETCHING then
        return "pending"
      end
      return true
    end
  end
end

-- Function to check if a plugin is available
-- @param plugin string
-- @return boolean
M.hasPlugin = function(plugin)
  return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

-- Function to concatenate command keybinds
-- @param command string
-- @return string
M.cmd = function(command)
  return table.concat { "<Cmd>", command, "<CR>" }
end

-- Function to print_r tables
-- @param arr table
-- @param indentLevel number
-- @return string
M.print_r = function(arr, indentLevel)
  local str = ""
  local indentStr = "#"

  if indentLevel == nil then
    print(M.print_r(arr, 0))
    return
  end

  for i = 0, indentLevel do
    indentStr = indentStr .. "\t"
  end

  for index, value in pairs(arr) do
    if type(value) == "table" then
      str = str .. indentStr .. index .. ": \n" .. M.print_r(value, (indentLevel + 1))
    else
      str = str .. indentStr .. index .. ": " .. value .. "\n"
    end
  end
  return str
end

return M
