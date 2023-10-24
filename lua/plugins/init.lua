return {
  { 'tpope/vim-sleuth' },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    "nvim-tree/nvim-web-devicons"
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  { 'SmiteshP/nvim-navic' },
  {
    'nvim-pack/nvim-spectre',
    event = 'VeryLazy'
  },
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex'
        },
        filetypes_denylist = {
          "dirvish",
          "fugitive",
          "alpha",
          "NvimTree",
          "lazy",
          "neogitstatus",
          "Trouble",
          "lir",
          "Outline",
          "spectre_panel",
          "toggleterm",
          "DressingSelect",
          "TelescopePrompt",
        },
        under_cursor = true,
      })
    end
  },
  {
    'APZelos/blamer.nvim',
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' }
    },
    config = function()
      require('neoclip').setup()
      require('telescope').load_extension('neoclip')
      vim.keymap.set("n", "<leader>v", function() vim.cmd("Telescope neoclip") end)
    end
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({
        autotag = {
          enable = true
        }
      })
    end
  },
}
