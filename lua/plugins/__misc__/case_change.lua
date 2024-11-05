return {
  {
    "orhnk/vim-case-change",
    event = { "BufReadPost", "BufNewFile" },
    keys = function()
      local cmd = require("utils").cmd
      local map = vim.keymap.set

      vim.g.casechange_nomap = 1

      map("v", "<M-S>", cmd "ToggleCase", { desc = "case change" })
      map({ "i", "n" }, "<M-S>", "<ESC>viw<CMD>ToggleCase<CR>", { desc = "case change" })
    end,
  },
}
