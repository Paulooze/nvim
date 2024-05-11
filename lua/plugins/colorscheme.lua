return {
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    config = function()
      vim.cmd.colorscheme('nordic')
    end
  }, {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  -- config = function() vim.cmd [[colorscheme tokyonight]] end
},
  {
    "oxfist/night-owl.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd.colorscheme("night-owl")
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
      })
      -- vim.cmd("colorscheme cyberdream")   -- set the colorscheme
    end,
  }
}
