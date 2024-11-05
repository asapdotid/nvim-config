return {
  {
    "mbbill/undotree",
    event = "VeryLazy",
    keys = function()
      local cmd = require("utils").cmd
      local map = vim.keymap.set

      map("n", "<leader><F5>", cmd "UndotreeToggle", { desc = "undotree" })
    end,
  },
}
