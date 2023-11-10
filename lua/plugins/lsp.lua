local icons = require("utils.icons")

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim", "jay-babu/mason-null-ls.nvim",
    "nvimtools/none-ls.nvim", "neovim/nvim-lspconfig", "folke/neodev.nvim",
    "hinell/lsp-timeout.nvim"
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = ""
        }
      }
    })
    require("mason-lspconfig").setup()
    require("mason-null-ls").setup({
      ensure_installed = {"eslint_d", "prettierd"},
      automatic_installation = true,
      handlers = {}
    })
    require("null-ls").setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({buffer = bufnr})
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format({bufnr = bufnr}) end
          })
        end
      end
    })
    require('neodev').setup();

    local mason_lspconfig = require("mason-lspconfig")
    local servers = {
      rust_analyzer = {},
      tsserver = {},
      graphql = {},
      html = {filetypes = {"html", "twig", "hbs"}},
      lua_ls = {
        Lua = {
          workspace = {checkThirdParty = false},
          telemetry = {enable = false}
        }
      }
    }
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true
    })

    local navic = require("nvim-navic")
    navic.setup({
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' '
      }
    })

    local on_attach = function(client, bufnr)
      local nmap = function(keys, func, desc)
        if desc then desc = "LSP: " .. desc end
        vim.keymap.set("n", keys, func, {buffer = bufnr, desc = desc})
      end

      navic.attach(client, bufnr)

      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("gd", require("telescope.builtin").lsp_definitions,
           "[G]oto [D]efinition")
      nmap("gr", require("telescope.builtin").lsp_references,
           "[G]oto [R]eferences")
      nmap("gI", require("telescope.builtin").lsp_implementations,
           "[G]oto [I]mplementation")
      nmap("<leader>D", require("telescope.builtin").lsp_type_definitions,
           "Type [D]efinition")
      nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols,
           "[D]ocument [S]ymbols")
      nmap("K", require("hover").hover, "Hover Documentation")
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, {desc = "Format current buffer with LSP"})

      local function set_handler_opts_if_not_set(name, handler, opts)
        if debug.getinfo(vim.lsp.handlers[name], "S").source:find(vim.env
                                                                    .VIMRUNTIME,
                                                                  1, true) then
          vim.lsp.handlers[name] = vim.lsp.with(handler, opts)
        end
      end

      set_handler_opts_if_not_set("textDocument/hover", vim.lsp.handlers.hover,
                                  {border = "rounded"})
      set_handler_opts_if_not_set("textDocument/signatureHelp",
                                  vim.lsp.handlers.signature_help,
                                  {border = "rounded"})

      -- Enable rounded borders in :LspInfo window.
      require("lspconfig.ui.windows").default_options.border = "rounded"
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes
        })
      end
    })

    local signs = {
      Error = icons.diagnostics.BoldError,
      Warn = icons.diagnostics.BoldWarning,
      Hint = icons.diagnostics.BoldHint,
      Info = icons.diagnostics.BoldInformation
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
    end
  end,
  event = 'VeryLazy'
}
