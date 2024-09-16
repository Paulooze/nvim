return {
  'folke/which-key.nvim',
  opts = {
    preset = 'modern'
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      '<leader>w',
      '<cmd>w!<CR>',
      desc = 'Save'
    },
    {
      '<leader>q',
      '<cmd>confirm q<CR>',
      desc = 'Quit'
    },
    {
      '<leader>/',
      '<Plug>(comment_toggle_linewise_current)',
      desc = 'Comment toggle current line'
    },
    {
      '<leader>c',
      '<cmd>BufferKill<CR>',
      desc = 'Close current buffer'
    },
    { "<leader>f",  "<cmd>Telescope find_files<cr>",                    desc = "Find File",                                   mode = "n" },
    { '<leader>h',  '<cmd>nohlsearch<CR>',                              desc = 'No highlight' },
    { '<leader>e',  '<cmd>NvimTreeToggle<CR>',                          desc = 'Explorer' },
    { '<leader>v',  '<cmd>Telescope neoclip<CR>',                       desc = 'Telescope neoclip' },
    { '<leader>o',  '<cmd>Telescope projections<CR>',                       desc = 'Telescope projections' },
    -- Buffers
    { '<leader>b',  desc = 'buffers' },
    { '<leader>bj', '<cmd>BufferLinePick<CR>',                          desc = 'Buffers: Jump to buffer' },
    { '<leader>bf', '<cmd>Telescope buffers previewer=false<CR>',       desc = 'Buffers: Find open buffer' },
    { '<leader>bb', '<cmd>BufferLineCyclePrev<CR>',                     desc = 'Buffers: Jump to previous buffer' },
    { '<leader>bn', '<cmd>BufferLineCycleNext<CR>',                     desc = 'Buffers: Jump to next buffer' },
    { '<leader>bw', '<cmd>noautocmd w<CR>',                             desc = 'Buffers: Save without formatting (noautocmd)' },
    { '<leader>be', '<cmd>BufferLinePickClose',                         desc = 'Buffers: Pick buffer to close' },
    -- LSP
    { '<leader>l',  desc = 'LSP' },
    { '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>',           desc = 'Code action' },
    { '<leader>ld', '<cmd>Telescope diagnostics bufnr=0<CR>',           desc = 'Buffer diagnostics' },
    { '<leader>lw', '<cmd>Telescope diagnostics<CR>',                   desc = 'Workspace diagnostics' },
    { '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>',                desc = 'Format' },
    { '<leader>lj', '<cmd>lua vim.diagnostic.goto_next()<CR>',          desc = 'Next diagnostic' },
    { '<leader>lk', '<cmd>lua vim.diagnostic.goto_prev()<CR>',          desc = 'Previous diagnostic' },
    { '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<CR>',              desc = 'Codelens actions' },
    { '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>',         desc = 'Quickfix' },
    { '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>',                desc = 'Rename' },
    { '<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>',          desc = 'Document symbols' },
    { '<leader>lS', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Workspace symbols' },
    { '<leader>le', '<cmd>Telescope quickfix<CR>',                      desc = 'Telescope quickfix' },
    -- Search
    { "<leader>sf", "<cmd>Telescope find_files<cr>",                    desc = "Find File",                                   mode = "n" },
    { '<leader>sr', '<cmd>Telescope oldfiles<CR>',                      desc = 'Open recent files' },
    { '<leader>st', '<cmd>Telescope live_grep<CR>',                     desc = 'Search text' },
    { '<leader>sl', '<cmd>Telescope resume<CR>',                        desc = 'Resume last search' },
    { '<leader>sC', '<cmd>Telescope commands<CR>',                      desc = 'Commands' },
    { '<leader>sR', '<cmd>Telescope registers<CR>',                     desc = 'Registers' },
    { '<leader>sk', '<cmd>Telescope keymaps<CR>',                       desc = 'Keymaps' },
  },
  event = 'VeryLazy'
}
