return {
  {
    "nat-418/boole.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("boole").setup {
        mappings = {
          increment = "<C-a>",
          decrement = "<C-x>",
        },
      }
    end,
  },
}
