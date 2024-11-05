return {
   {
      "mbbill/undotree",
      event = "VeryLazy",
      keys = function()
        local __Utils = require "utils"
        local map = vim.keymap.set

        map("n", "<leader><F5>", __Utils.cmd "UndotreeToggle", { desc = "undotree" })
      end,
    }
  }
