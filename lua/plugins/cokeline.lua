local icons = require("utils.icons")

local function get_error_string(errors)
  if errors > 0 then
    return ' ' .. icons.diagnostics.Error .. ' ' .. errors .. ' '
  else
    return ''
  end
end
local function get_warning_string(warnings)
  if warnings > 0 then
    return ' ' .. icons.diagnostics.Warning .. ' ' .. warnings .. ' '
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
    local palette = require('tokyonight.colors').setup()

    require('cokeline').setup({
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and get_hex('ColorColumn', 'bg') or
              get_hex('Comment', 'fg')
        end,
        bg = function(buffer)
          return buffer.is_focused and palette.blue or
              get_hex('ColorColumn', 'bg')
        end
      },
      components = {
        { text = ' ', hl = { bg = get_hex('Normal', 'bg') } }, {
        text = function(buffer)
          return (is_picking_focus() or is_picking_close()) and
              buffer.pick_letter .. ' ' or buffer.devicon.icon
        end,
        fg = function(buffer)
          return (is_picking_focus() and palette.orange) or
              (is_picking_close() and palette.red1) or
              buffer.devicon.color
        end,
        italic = function()
          return (is_picking_focus() or is_picking_close())
        end,
        bold = function()
          return (is_picking_focus() or is_picking_close())
        end
      }, { text = ' ' }, {
        fg = get_hex('Normal', 'bg'),
        text = function(buffer)
          if (buffer.is_modified) then
            return 'M' .. ' '
          else
            return ''
          end
        end,
        bold = true
      }, {
        text = function(buffer) return buffer.filename end,
        bold = function(buffer) return buffer.is_focused end
      }, { text = '  ' }, {
        fg = palette.error,
        text = function(buffer)
          return get_error_string(buffer.diagnostics.errors)
        end
      }, {
        fg = palette.warning,
        text = function(buffer)
          return get_warning_string(buffer.diagnostics.warnings)
        end
      }, {
        text = ' ' .. icons.ui.Close,
        on_click = function(_, _, _, _, buffer) buffer:delete() end
      }, { text = ' ', hl = { bg = get_hex('Normal', 'bg') } }
      },
      sidebar = {
        filetype = { "NvimTree" },
        components = {
          {
            text = function(buf) return '  ' .. buf.filetype end,
            fg = palette.orange,
            bg = function() return get_hex('NvimTreeNormal', 'bg') end,
            bold = true
          }
        }
      }

    })
  end
}
