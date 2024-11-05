local M = {}

---@class HLTable
M.add = {
  St_Package = {
    fg = "yellow",
  },
  St_ai = {
    fg = "cyan",
  },
}

---@class HLTable
M.override = {
  Comment = { italic = true },
  ["@comment"] = { italic = true },
  NvDashAscii = {
    bg = "none",
    fg = (not "accent_green") and "blue" or "accent_green",
  },
  NvDashButtons = {
    bg = "none",
  },
  St_NormalMode = { bg = "accent_green" },
  St_NormalModeSep = { fg = "accent_green" },
  NvimTreeNormal = { bg = "black" },
  NvimTreeNormalNC = { bg = "black" },
  NvimTreeEndOfBuffer = { bg = "black" },
  NvimTreeWinSeparator = {
    fg = "black",
    bg = "black",
  },
  St_Lsp = {
    fg = "accent_green",
  },
}

return M
