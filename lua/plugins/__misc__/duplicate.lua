return {
  {
    "hinell/duplicate.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LineDuplicate", "VisualDuplicate" },
    config = function()
      vim.g["duplicate-nvim-config"] = {
        visual = {
          selectAfter = true, -- true to select duplicated text
          block = true, -- true to enable block-wise duplication
        },
      }
    end,
    keys = function()
      local cmd = require("utils").cmd
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- map("n", "<C-A-Up>", Utils.cmd "LineDuplicate -1", opts)
      map("n", "<C-A-k>", cmd "LineDuplicate -1", opts)
      -- map("n", "<C-A-Down>", cmd "LineDuplicate +1", opts)
      map("n", "<C-A-j>", cmd "LineDuplicate +1", opts)
      -- map("v", "<C-A-Up>", cmd "VisualDuplicate -1", opts)
      map("v", "<C-A-k>", cmd "VisualDuplicate -1", opts)
      -- map("v", "<C-A-Down>", cmd "VisualDuplicate +1", opts)
      map("v", "<C-A-j>", cmd "VisualDuplicate +1", opts)
    end,
  },
}
