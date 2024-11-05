return {
  {
      "itchyny/vim-highlighturl",
      event = "BufReadPost",
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          desc = "Disable URL highlights",
          pattern = {
            "fzf",
            "lazyterm",
            "nvterm",
            "spectre_panel",
          },
          command = "call highlighturl#disable_local()",
        })
      end,
    }
  }
