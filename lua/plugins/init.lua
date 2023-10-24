local icons = require("../icons")

local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api");

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr);

  vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  vim.keymap.set("n", "<leader>e", function() vim.cmd("NvimTreeToggle") end)
end

return {
  {
    "nvim-tree/nvim-web-devicons"
  },
  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      local which_key = require('which-key')
      local whichkey_opts = require('plugins.whichkey');

      which_key.setup(whichkey_opts.setup)
      which_key.register(whichkey_opts.mappings, whichkey_opts.options)
      which_key.register(whichkey_opts.vmappings, whichkey_opts.voptions)
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require('nvim-tree').setup({
        diagnostics = {
          enable = true
        },
        on_attach = nvim_tree_on_attach
      })
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
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
  },
  { 'SmiteshP/nvim-navic' },
  {
    'nvim-pack/nvim-spectre'
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup(require('plugins.bufferline').setup)
    end
  },
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex'
        }
      })
    end
  },
  {
    'APZelos/blamer.nvim'
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end
  },
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      { 'nvim-telescope/telescope.nvim' }
    },
    config = function()
      require('neoclip').setup()
      require('telescope').load_extension('neoclip')
      vim.keymap.set("n", "<leader>v", function() vim.cmd("Telescope neoclip") end)
    end
  },
  {
    'gnikdroy/projections.nvim',
    config = function()
      require("projections").setup({
        workspaces = {
          { "~/Projects", { ".git", "package.json" } }
        }
      })
      require("telescope").load_extension("projections")
      vim.keymap.set("n", "<leader>o", function() vim.cmd("Telescope projections") end)

      local Session = require("projections.session")
      vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
        callback = function() Session.store(vim.loop.cwd()) end,
      })

      local switcher = require("projections.switcher")
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
        end,
      })
    end
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({
        autotag = {
          enable = true
        }
      })
    end
  },
  { 'akinsho/toggleterm.nvim' }
}
