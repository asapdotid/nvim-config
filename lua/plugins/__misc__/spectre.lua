return {
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require("spectre").setup {
        result_padding = "",
        default = {
          replace = {
            cmd = "sed",
          },
        },
      }
    end,
    keys = function()
      local cmd = require("utils").cmd
      local map = vim.keymap.set

      map("n", "<leader>fss", cmd "lua require('spectre').toggle()", { desc = "search toggle" })
      map(
        { "n", "v" },
        "<leader>fsw",
        cmd "lua require('spectre').open_visual({select_word=true})",
        { desc = "search current word" }
      )
      map(
        "n",
        "<leader>fs.",
        cmd "lua require('spectre').open_file_search({select_word=true})",
        { desc = "search on current file" }
      )
    end,
  },
}
