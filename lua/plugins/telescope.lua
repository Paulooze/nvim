return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim', {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function() return vim.fn.executable 'make' == 1 end
  }
  },
  config = function()
    require('telescope').setup({
      defaults = { mappings = { i = { ['<C-u>'] = false, ['<C-d>'] = false } } },
      extensions = { import = { insert_at_top = true } }
    })

    pcall(require('telescope').load_extension, 'fzf')
  end
}
