local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
  'nvimtools/none-ls.nvim',
  config = function()
    local none_ls = require('null-ls')
    none_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                timeout_ms = 5000,
                bufnr = bufnr,
                filter = function(client)
                  return client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
      debug = true,
      sources = {
        none_ls.builtins.formatting.eslint,
        none_ls.builtins.diagnostics.eslint,
        none_ls.builtins.code_actions.eslint,
        none_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "css",
            "scss",
            "html",
            "json",
            "yaml",
            "markdown",
            "graphql",
            "md",
            "txt",
          },
        })
      },
    })
  end,
}
