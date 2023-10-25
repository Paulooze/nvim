return {
  "marko-cerovac/material.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require('material').setup({

      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        -- "eyeliner",
        -- "fidget"
        -- "flash"
        "gitsigns",                       -- "harpoon",
        -- "hop",
        "illuminate", "indent-blankline", -- "lspsaga",
        -- "mini",
        -- "neogit",
        -- "neotest",
        -- "neorg",
        -- "noice"
        "nvim-cmp",                       -- "nvim-navic",
        "nvim-tree", "nvim-web-devicons", -- "rainbow-delimiters",
        -- "sneak",
        "telescope",                      -- "trouble",
        "which-key"
      },
      lualine_style = 'stealth'
    })
    vim.cmd.colorscheme 'material-deep-ocean'
  end
}
