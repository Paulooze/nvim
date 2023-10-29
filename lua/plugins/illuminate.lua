return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      providers = { 'lsp', 'treesitter', 'regex' },
      filetypes_denylist = {
        "dirvish", "fugitive", "alpha", "NvimTree", "lazy", "neogitstatus",
        "Trouble", "lir", "Outline", "spectre_panel", "toggleterm",
        "DressingSelect", "TelescopePrompt"
      },
      under_cursor = true
    })
  end,
  event = 'VeryLazy'
}
