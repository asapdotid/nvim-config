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
local ui = "plugins.__ui__."

if Env.nvim_tree then
  table.insert(plugins, require(ui .. "nvim_tree"))
end
if Env.dressing then
  table.insert(plugins, require(ui .. "dressing"))
end
if Env.noice then
  table.insert(plugins, require(ui .. "noice"))
end
if Env.neoscroll then
  table.insert(plugins, require(ui .. "neoscroll"))
end
if Env.quite then
  table.insert(plugins, require(ui .. "quit"))
end
if Env.fold then
  table.insert(plugins, require(ui .. "fold"))
end
if Env.highlighturl then
  table.insert(plugins, require(ui .. "highlighturl"))
end
if Env.indent_blankline then
  table.insert(plugins, require(ui .. "indent_blankline"))
end
if Env.flash then
  table.insert(plugins, require(ui .. "flash"))
end
if Env.visual_multi then
  table.insert(plugins, require(ui .. "visual_multi"))
end
if Env.bookmarks then
  table.insert(plugins, require(ui .. "bookmarks"))
end
if Env.todo_comments then
  table.insert(plugins, require(ui .. "todo_comments"))
end
if Env.trouble then
  table.insert(plugins, require(ui .. "trouble"))
end
if Env.undotree then
  table.insert(plugins, require(ui .. "undotree"))
end

return plugins
