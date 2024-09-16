return {
  -- {
  --   'navarasu/onedark.nvim',
  --   lazy = false,
  --   config = function()
  --     require('onedark').load()
  --   end
  -- }
  'pineapplegiant/spaceduck',
  lazy = false,
  config = function()
    vim.cmd('colorscheme spaceduck')
  end
}
