return {
  'tamago324/lir.nvim',
  config = function()
    local actions = require('lir.actions')
    local clipboard_actions = require('lir.clipboard.actions')

    require('lir').setup({
      show_hidden_files = true,
      ignore = {}, -- { ".DS_Store" "node_modules" } etc.
      devicons = { enable = true, highlight_dirname = true },
      mappings = {
        ["l"] = actions.edit,
        ["<CR>"] = actions.edit,
        ["<C-s>"] = actions.split,
        ["v"] = actions.vsplit,
        ["<C-t>"] = actions.tabedit,

        ["h"] = actions.up,
        ["q"] = actions.quit,

        ["A"] = actions.mkdir,
        ["a"] = actions.newfile,
        ["r"] = actions.rename,
        ["@"] = actions.cd,
        ["Y"] = actions.yank_path,
        ["i"] = actions.toggle_show_hidden,
        ["d"] = actions.delete,

        ["J"] = function()
          require("lir.mark.actions").toggle_mark()
          vim.cmd "normal! j"
        end,
        ["c"] = clipboard_actions.copy,
        ["x"] = clipboard_actions.cut,
        ["p"] = clipboard_actions.paste
      },
      float = {
        winblend = 0,
        curdir_window = { enable = false, highlight_dirname = true },

        -- You can define a function that returns a table to be passed as the third
        -- argument of nvim_open_win().
        win_opts = function()
          local width = math.floor(vim.o.columns * 0.7)
          local height = math.floor(vim.o.lines * 0.7)
          return { border = "rounded", width = width, height = height }
        end
      },
      hide_cursor = false
    })
  end,
  event = 'VeryLazy'
}
