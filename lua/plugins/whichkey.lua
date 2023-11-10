local icons = require("utils.icons")

local setup = {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = true, suggestions = 20 },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
  },
  operators = { gc = "Comments" },
  key_labels = {},
  icons = {
    breadcrumb = icons.ui.DoubleChevronRight,
    separator = icons.ui.BoldArrowRight,
    group = icons.ui.Plus
  },
  popup_mappings = { scroll_down = "<c-d>", scroll_up = "<c-u>" },
  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left"
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  show_keys = true,
  triggers = "auto",
  triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" } },
  disable = { buftypes = {}, filetypes = { "TelescopePrompt" } }
}

local mappings = {
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>confirm q<CR>", "Quit" },
  ["/"] = {
    "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line"
  },
  ["c"] = { "<cmd>BufferKill<CR>", "Close Buffer" },
  ["f"] = {
    function() require("telescope.builtin").find_files({ previewer = false }) end,
    "Find File"
  },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
  ["v"] = { "<cmd>Telescope neoclip<CR>", "Telescope neoclip" },
  ["o"] = { "<cmd>Telescope projections<CR>", "Telescope projections" },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
    e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
    D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
    L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" }
  },
  x = {
    name = "Trouble",
    x = { function() require('trouble').toggle() end, "Diagnostic" },
    w = {
      function() require('trouble').toggle('workspace_diagnostics') end,
      "Workspace diagnostics"
    },
    d = {
      function() require('trouble').toggle('document_diagnostics') end,
      "Document diagnostics"
    },
    q = { function() require('trouble').toggle('quickfix') end, "Quickfix" }
  },
  p = {
    name = "Plugins",
    i = { "<cmd>Lazy install<cr>", "Install" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    S = { "<cmd>Lazy clear<cr>", "Status" },
    c = { "<cmd>Lazy clean<cr>", "Clean" },
    u = { "<cmd>Lazy update<cr>", "Update" },
    p = { "<cmd>Lazy profile<cr>", "Profile" },
    l = { "<cmd>Lazy log<cr>", "Log" },
    d = { "<cmd>Lazy debug<cr>", "Debug" }
  },
  g = {
    name = "Git",
    g = { "<cmd>lua require 'utils.lazygit'.lazygit_toggle()<cr>", "Lazygit" },
    j = {
      "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
      "Next Hunk"
    },
    k = {
      "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
      "Prev Hunk"
    },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" }
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
      "Buffer Diagnostics"
    },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" }
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview"
    }
  },
  T = { name = "Treesitter", i = { ":TSConfigInfo<cr>", "Info" } }
}
local options = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true
}
local vmappings = {
  ["/"] = {
    "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)"
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" }
  }
}
local voptions = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true
}

return {
  "folke/which-key.nvim",
  opts = {},
  config = function()
    local which_key = require("which-key")

    which_key.setup(setup)
    which_key.register(mappings, options)
    which_key.register(vmappings, voptions)
  end,
  event = "VeryLazy"
}
