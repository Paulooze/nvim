return {
  require('plugins.bufferline'),
  require('plugins.whichkey'),
  {
    "nvim-tree/nvim-web-devicons"
  },
  require('plugins.nvimtree'),
  require('plugins.projections'),
  require('plugins.lir'),
  require('plugins.treesitter'),
  require('plugins.telescope'),
  require('plugins.nonels'),
  require('plugins.gitsigns'),
  require('plugins.lualine'),
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  { 'SmiteshP/nvim-navic' },
  {
    'nvim-pack/nvim-spectre'
  },
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex'
        }
      })
    end
  },
  {
    'APZelos/blamer.nvim'
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end
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
  { 'akinsho/toggleterm.nvim' }
}
