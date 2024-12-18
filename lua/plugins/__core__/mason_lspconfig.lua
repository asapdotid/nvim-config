return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      local __Utils = require "utils"
      local lspconfig = package.loaded["lspconfig"]

      -- List of servers to ignore during install
      local ignore_install = {}

      -- Build a list of lsp servers to install minus the ignored list.
      local all_servers = {}
      for _, s in ipairs(lspconfig.servers) do
        if not __Utils.TableContents(ignore_install, s) then
          table.insert(all_servers, s)
        end
      end

      require("mason-lspconfig").setup {
        ensure_installed = all_servers,
        automatic_installation = false,
      }
    end,
  },
}
