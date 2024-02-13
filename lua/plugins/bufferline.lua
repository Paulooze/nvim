return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        style_preset = bufferline.style_preset.default,
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = false
          }
        }
      }
    })
  end
}
