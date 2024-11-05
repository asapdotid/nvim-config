return {
  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = function()
      local mason_conform = require "mason-conform"

      mason_conform.setup {
        -- List of formatters to ignore during install
        ignore_install = {},
      }
    end,
  }
}
