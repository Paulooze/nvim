local icons = require('utils.icons')

return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'spaceduck',
        ignore_focus = {},
        component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
        refresh = { statusline = 1000, tabline = 1000, winbar = 1000 }
      },
      sections = {
        lualine_a = { { 'mode', icons_enabled = true, icon = '', separator = { left = '', right = '' }, right_padding = 2 } },
        lualine_b = {
          { 'b:gitsigns_head', icon = icons.git.Branch, color = { gui = 'bold' }, }
        },
        lualine_c = {
          {
            'diff',
            symbols = {
              added = icons.git.LineAdded .. ' ',
              modified = icons.git.LineModified .. ' ',
              removed = icons.git.LineRemoved .. ' '
            },
            padding = { left = 2, right = 1 },
            diff_color = {
              added = { fg = '#5ccc96' },
              modified = { fg = '#f2ce00' },
              removed = { fg = '#e33400' }
            },
            cond = nil
          }
        },
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = {
              error = icons.diagnostics.BoldError .. ' ',
              warn = icons.diagnostics.BoldWarning .. ' ',
              info = icons.diagnostics.BoldInformation .. ' ',
              hint = icons.diagnostics.BoldHint .. ' '
            }
          }, {
          function()
            local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
            if #buf_clients == 0 then return 'LSP Inactive' end

            local buf_client_names = {}

            -- add client
            for _, client in pairs(buf_clients) do
              if (client.name ~= 'null-ls') then
                table.insert(buf_client_names, client.name)
              end
            end

            local unique_client_names = table.concat(buf_client_names, ', ')
            local language_servers =
                string.format('[%s]', unique_client_names)

            return language_servers
          end,
          padding = { right = 2, left = 2 }
        }, {
          function()
            local shiftwidth = vim.api.nvim_get_option_value('shiftwidth', { buf = 0 })
            return icons.ui.Tab .. ' ' .. shiftwidth
          end,
          padding = 1
        }, { 'filetype', cond = nil, padding = { left = 1, right = 1 } }
        },
        lualine_y = { { 'progress', } },
        lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } }
      },
      tabline = {},
      extensions = {}
    })
  end
}
