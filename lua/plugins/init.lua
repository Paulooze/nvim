return {
  { "tpope/vim-sleuth" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",          opts = {} },
  { "windwp/nvim-autopairs",               event = "InsertEnter", opts = {} },
  { "SmiteshP/nvim-navic" },
  { "nvim-pack/nvim-spectre",              event = "VeryLazy" },
  {
    "APZelos/blamer.nvim",
    config = function()
      vim.g.blamer_enabled = true
    end,
  },
}
