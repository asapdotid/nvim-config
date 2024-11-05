-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local Utils = require "utils"
local Env = require "configs.env"
local hl = require "configs.hl"
local icons = require "configs.icons"
local changed_themes = require "configs.themes"

---@class ChadrcConfig
local M = {}

M.base46 = {
	theme = Env.theme,
  transparency = Env.transparency,
  hl_add = hl.add,
  hl_override = hl.override,
  changed_themes = {
    onedark = changed_themes[Env.theme],
    manjaro = changed_themes[Env.theme],
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
  },

  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashAscii", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashAscii",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashAscii", no_gap = true, rep = true },
  },
}

M.ui = {
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
  },

  statusline = {
    theme = "default",
    -- separator_style = "arrow",
    order = {
      "mode",
      "relativepath",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "package",
      "ai",
      "spaces",
      "diagnostics",
      "lsp",
      "cursor",
      "cwd",
    },
    modules = {
      git = function()
        if not vim.b[Utils.stbufnr()].gitsigns_head or vim.b[Utils.stbufnr()].gitsigns_git_status then
          return ""
        end

        local git_status = vim.b[Utils.stbufnr()].gitsigns_status_dict

        local added = (git_status.added and git_status.added ~= 0) and ("%#St_lspInfo#  " .. git_status.added) or ""
        local changed = (git_status.changed and git_status.changed ~= 0)
            and ("%#St_lspWarning#  " .. git_status.changed)
          or ""
        local removed = (git_status.removed and git_status.removed ~= 0)
            and ("%#St_lspError#  " .. git_status.removed)
          or ""
        local branch_name = "%#StText# " .. git_status.head

        return " " .. branch_name .. added .. changed .. removed
      end,

      relativepath = function()
        local path = vim.api.nvim_buf_get_name(Utils.stbufnr())

        if path == "" then
          return ""
        end

        return "%#St_file# " .. vim.fn.expand "%:.:h" .. " /"
      end,

      package = function()
        local lazy_status = require "lazy.status"
        local icon = ""

        if lazy_status.has_updates() then
          icon = "%#St_Package#" .. lazy_status.updates()
        end

        return icon .. " "
      end,

      lsp = function()
        return "%#St_Lsp#" .. Utils.lsp()
      end,

      spaces = function()
        return " " .. "%#St_lspInfo#" .. icons.ui.Tab .. " " .. vim.api.nvim_get_option_value("sw", {})
      end,

      ai = function()
        local icon = "" -- 󱜙  󰘦

        local status_ok, _ = pcall(require, "codeium")
        if status_ok then
          icon = "%#St_ai#" .. icons.misc.Robot .. " "
        end

        return icon
      end,

      cursor = "%#St_pos_text# Ln %l, Col %c ",

      cwd = function()
        local name = vim.uv.cwd()
        name = "%#St_cwd_icon# 󰉖 " .. (name:match "([^/\\]+)[/\\]*$" or name) .. " "
        return (vim.o.columns > 85 and name) or ""
      end,
    },
  },
}

return M
