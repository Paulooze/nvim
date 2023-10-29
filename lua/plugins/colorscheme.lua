return {
  "marko-cerovac/material.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require('material').setup({
      plugins = {
        "gitsigns", "illuminate", "indent-blankline", "nvim-cmp", "nvim-tree",
        "nvim-web-devicons", "telescope", "which-key"
      },
      lualine_style = 'stealth'
    })
    vim.cmd.colorscheme 'material-deep-ocean'
  end
}
