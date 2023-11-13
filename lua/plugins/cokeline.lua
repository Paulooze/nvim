local icons = require("utils.icons")

local function get_error_string(errors)
  if errors > 0 then
    return icons.diagnostics.Error .. ' ' .. errors
  else
    return ''
  end
end
local function get_warning_string(warnings)
  if warnings > 0 then
    return icons.diagnostics.Warning .. ' ' .. warnings
  else
    return ''
  end
end

return {
  "willothy/nvim-cokeline",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  config = function()
    local is_picking_focus = require('cokeline.mappings').is_picking_focus
    local is_picking_close = require('cokeline.mappings').is_picking_close
    local get_hex = require('cokeline.hlgroups').get_hl_attr
    local red = vim.g.terminal_color_1
    local yellow = vim.g.terminal_color_3
    local palette = require('nordic.colors')

    require('cokeline').setup({
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and get_hex('Normal', 'fg') or
              get_hex('Comment', 'fg')
        end,
        bg = function() return get_hex('ColorColumn', 'bg') end
      },
      components = {
        { text = ' ', bg = get_hex('Normal', 'bg') },
        {
          text = '',
          fg = get_hex('ColorColumn', 'bg'),
          bg = get_hex('Normal', 'bg')
        }, {
        text = function(buffer)
          return (is_picking_focus() or is_picking_close()) and
              buffer.pick_letter .. ' ' or buffer.devicon.icon
        end,
        fg = function(buffer)
          return (is_picking_focus() and yellow) or
              (is_picking_close() and red) or buffer.devicon.color
        end,
        italic = function()
          return (is_picking_focus() or is_picking_close())
        end,
        bold = function()
          return (is_picking_focus() or is_picking_close())
        end
      }, { text = ' ' }, {
        fg = palette.fg_sidebar,
        text = function(buffer)
          if (buffer.is_modified) then
            return icons.ui.Pencil .. "  "
          else
            return ''
          end
        end
      }, {
        text = function(buffer) return buffer.filename end,
        bold = function(buffer) return buffer.is_focused end
      }, { text = '  ' }, {
        fg = palette.error,
        text = function(buffer)
          return get_error_string(buffer.diagnostics.errors)
        end
      }, { text = ' ' }, {
        fg = palette.warn,
        text = function(buffer)
          return get_warning_string(buffer.diagnostics.warnings)
        end
      }, { text = '  ' }, {
        text = icons.ui.Close,
        on_click = function(_, _, _, _, buffer) buffer:delete() end
      },
        {
          text = '',
          fg = get_hex('ColorColumn', 'bg'),
          bg = get_hex('Normal', 'bg')
        }
      },
      sidebar = {
        filetype = { "NvimTree" },
        components = {
          {
            text = function(buf) return buf.filetype end,
            fg = yellow,
            bg = function() return get_hex('NvimTreeNormal', 'bg') end,
            bold = true
          }
        }
      }

    })
  end
}
