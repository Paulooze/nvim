return {
  'windwp/nvim-ts-autotag',
  config = function()
    require('nvim-ts-autotag').setup({
      enabled = true,
      enable_close_on_slash = true,
      enable_rename = true,
      filetypes = {
        'html', 'javascript', 'typescript', 'typescript.glimmer',
        'javascript.glimmer', 'javascriptreact', 'typescriptreact', 'markdown',
        'glimmer', 'handlebars', 'hbs', 'svelte', 'vue', 'tsx', 'jsx'
      }
    })
  end
}
