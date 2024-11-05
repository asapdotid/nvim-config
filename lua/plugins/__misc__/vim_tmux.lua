return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    conf = function()
      -- vim.g.tmux_navigator_no_mappings = 1
      local nvim_tmux_nav = require "nvim-tmux-navigator"

      nvim_tmux_nav.setup {
        disable_when_zoomed = true,
      }
    end,
    keys = function()
      local cmd = require "utils".cmd
      local map = vim.keymap.set

      map("n", "<C-h>", cmd "<C-U>TmuxNavigateLeft", { noremap = true })
      map("n", "<C-j>", cmd "<C-U>TmuxNavigateDown", { noremap = true })
      map("n", "<C-k>", cmd "<C-U>TmuxNavigateUp", { noremap = true })
      map("n", "<C-l>", cmd "<C-U>TmuxNavigateRight", { noremap = true })
      map("n", "<C-\\>", cmd "<C-U>TmuxNavigatePrevious", { noremap = true })
    end,
  },
}
