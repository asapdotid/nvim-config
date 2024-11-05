local Env = require "configs.env"

local plugins = {}

-- Core plugins
local core = "plugins.__core__."

if Env.cmp then
  table.insert(plugins, require(core .. "cmp"))
end
if Env.treesitter then
  table.insert(plugins, require(core .. "treesitter"))
end
if Env.gitsigns then
  table.insert(plugins, require(core .. "gitsigns"))
end
if Env.lspconfig then
  table.insert(plugins, require(core .. "lspconfig"))
end
if Env.mason_lspconfig then
  table.insert(plugins, require(core .. "mason_lspconfig"))
end
if Env.lint then
  table.insert(plugins, require(core .. "lint"))
end
if Env.mason_lint then
  table.insert(plugins, require(core .. "mason_lint"))
end
if Env.conform then
  table.insert(plugins, require(core .. "conform"))
end
if Env.mason_conform then
  table.insert(plugins, require(core .. "mason_conform"))
end
if Env.telescope then
    table.insert(plugins, require(core .. "telescope"))
end
if Env.lspsaga then
    table.insert(plugins, require(core .. "lspsaga"))
end
if Env.toggleterm then
    table.insert(plugins, require(core .. "toggleterm"))
end
if Env.yanky then
    table.insert(plugins, require(core .. "yanky"))
end

-- UI plugins
-- local ui = "plugins.__ui__."

return plugins
