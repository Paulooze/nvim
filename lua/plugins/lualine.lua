local icons = require('icons')

return {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        globalstatus = true,
        component_separators = {
          left = icons.ui.DividerRight,
          right = icons.ui.DividerLeft,
        },
        section_separators = {
          left = icons.ui.BoldDividerRight,
          right = icons.ui.BoldDividerLeft,
        },
      },
      sections = {
        lualine_x = {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = icons.diagnostics.BoldError .. " ",
            warn = icons.diagnostics.BoldWarning .. " ",
            info = icons.diagnostics.BoldInformation .. " ",
            hint = icons.diagnostics.BoldHint .. " ",
          },
        }
      }
    },
  }
