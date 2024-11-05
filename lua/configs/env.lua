local __Env = require "utils.env"

local M = {}

-- User interface
M.transparency = __Env.env("BASE_TRANSPARENCY", "boolean")
M.theme = __Env.env("BASE_THEME", "string")

-- Core activation plugins
M.ai = __Env.env("PLUGIN_CORE_AI", "boolean")
M.cmp = __Env.env("PLUGIN_CORE_CMP", "boolean")
M.treesitter = __Env.env("PLUGIN_CORE_TREESITTER", "boolean")
M.gitsigns = __Env.env("PLUGIN_CORE_GITSIGNS", "boolean")
M.lspconfig = __Env.env("PLUGIN_CORE_LSPCONFIG", "boolean")
M.mason_lspconfig = __Env.env("PLUGIN_CORE_MASON_LSPCONFIG", "boolean")
M.lint = __Env.env("PLUGIN_CORE_LINT", "boolean")
M.mason_lint = __Env.env("PLUGIN_CORE_MASON_LINT", "boolean")
M.conform = __Env.env("PLUGIN_CORE_CONFORM", "boolean")
M.mason_conform = __Env.env("PLUGIN_CORE_MASON_CONFORM", "boolean")
M.telescope = __Env.env("PLUGIN_CORE_TELESCOPE", "boolean")
M.lspsaga = __Env.env("PLUGIN_CORE_LSPSAGA", "boolean")
M.toggleterm = __Env.env("PLUGIN_CORE_TOGGLETERM", "boolean")
M.yanky = __Env.env("PLUGIN_CORE_YANKY", "boolean")

-- UI activation plugins
M.nvim_tree = __Env.env("PLUGIN_UI_NVIMTREE", "boolean")
M.dressing = __Env.env("PLUGIN_UI_DRESSING", "boolean")
M.noice = __Env.env("PLUGIN_UI_NOICE", "boolean")
M.neoscroll = __Env.env("PLUGIN_UI_NEOSCROLL", "boolean")
M.quite = __Env.env("PLUGIN_UI_QUITE", "boolean")
M.fold = __Env.env("PLUGIN_UI_FOLD", "boolean")
M.highlighturl = __Env.env("PLUGIN_UI_HIGHLIGHTURL", "boolean")
M.indent_blankline = __Env.env("PLUGIN_UI_INDENT_BLANKLINE", "boolean")
M.flash = __Env.env("PLUGIN_UI_FLASH", "boolean")
M.visual_multi = __Env.env("PLUGIN_UI_VISUAL_MULTI", "boolean")
M.bookmarks = __Env.env("PLUGIN_UI_BOOKMARKS", "boolean")
M.todo_comments = __Env.env("PLUGIN_UI_TODO_COMMENTS", "boolean")
M.trouble = __Env.env("PLUGIN_UI_TROUBLE", "boolean")
M.undotree = __Env.env("PLUGIN_UI_UNDOTREE", "boolean")

-- Misc activation plugins
M.comment = __Env.env("PLUGIN_MISC_COMMENT", "boolean")
M.editorconfig = __Env.env("PLUGIN_MISC_EDITORCONFIG", "boolean")
M.boole = __Env.env("PLUGIN_MISC_BOOLE", "boolean")
M.case_change = __Env.env("PLUGIN_MISC_CASE_CHANGE", "boolean")
M.move = __Env.env("PLUGIN_MISC_MOVE", "boolean")
M.duplicate = __Env.env("PLUGIN_MISC_DUPLICATE", "boolean")
M.dotenv = __Env.env("PLUGIN_MISC_DOTENV", "boolean")
M.illuminate = __Env.env("PLUGIN_MISC_ILLUMINATE", "boolean")
M.surround = __Env.env("PLUGIN_MISC_SURROUND", "boolean")
M.spectre = __Env.env("PLUGIN_MISC_SPECTRE", "boolean")
M.vim_tmux = __Env.env("PLUGIN_MISC_VIM_TMUX", "boolean")
M.vim_maximizer = __Env.env("PLUGIN_MISC_VIM_MAXIMIZER", "boolean")
M.session = __Env.env("PLUGIN_MISC_SESSION", "boolean")
M.rename = __Env.env("PLUGIN_MISC_RENAME", "boolean")
M.silicon = __Env.env("PLUGIN_MISC_SILICON", "boolean")

return M
