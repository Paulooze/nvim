return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        'astro', 'css', 'glimmer', 'graphql', 'html', 'javascript',
        'lua', 'nix', 'php', 'python', 'scss', 'svelte', 'tsx', 'twig',
        'typescript', 'vim', 'vue',
      }
    })
  end,
  build = ':TSUpdate',
}
