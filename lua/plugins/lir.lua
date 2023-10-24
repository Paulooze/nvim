return {
  'tamago324/lir.nvim',
  config = function()
    require('lir').setup({
      show_hidden_files = true,
      ignore = { 'node_modules' },
      devicons = {
        enable = true
      }
    })
  end
}
