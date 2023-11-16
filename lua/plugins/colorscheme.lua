return {
  {'AlexvZyl/nordic.nvim', lazy = false}, {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() vim.cmd [[colorscheme tokyonight]] end
  }
}
