return {
  {
    "nvimdev/lspsaga.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = false,
        },
      }
    end,
    keys = function()
      local cmd = require("utils").cmd
      local map = vim.keymap.set

      map("n", "<leader>lc", cmd "Lspsaga code_action", { desc = "lsp code action" })
      map("n", "<leader>lr", cmd "Lspsaga rename", { desc = "lsp rename" })
      map("n", "<leader>lf", cmd "Lspsaga finder", { desc = "lsp finder" })
      map("n", "<leader>lo", cmd "Lspsaga outline", { desc = "lsp outline" })
      map("n", "<leader>ld", cmd "Lspsaga goto_definition", { desc = "lsp goto definition" })
      map("n", "<leader>lp", cmd "Lspsaga preview_definition", { desc = "lsp preview definition" })
      map("n", "<leader>ls", cmd "Lspsaga signature_help", { desc = "lsp signature help" })
      map("n", "<leader>lw", cmd "Lspsaga show_workspace_diagnostics", { desc = "lsp workspace diagnostics" })
    end,
  },
}
