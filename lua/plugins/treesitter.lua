return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "go", "lua", "rust", "tsx", "javascript", "typescript", "vimdoc", "vim",
        "bash"
      },
      modules = {},
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = true,
      filetypes = {
        "html", "javascript", "javascriptreact", "typescript",
        "typescriptreact", "xml"
      }
    })
  end,
  build = ":TSUpdate",
  event = 'VeryLazy'
}
