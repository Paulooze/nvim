return {
  { "tpope/vim-sleuth" }, {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function() require('ibl').setup({ scope = { enabled = true } }) end
}, { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "SmiteshP/nvim-navic" }, { "nvim-pack/nvim-spectre", event = "VeryLazy" },
  { "APZelos/blamer.nvim", config = function() vim.g.blamer_enabled = true end }
}
