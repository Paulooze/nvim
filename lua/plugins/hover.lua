return {
  'lewis6991/hover.nvim',
  event = 'VeryLazy',
  config = function()
    require('hover').setup({
      init = function() require('hover.providers.lsp') end,
      preview_window = true,
      title = true
    })
  end
}
