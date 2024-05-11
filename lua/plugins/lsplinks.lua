return {
  "icholy/lsplinks.nvim",
  setup = function()
    local lsplinks = require("lsplinks")
    lsplinks.setup()
    vim.keymap.set("n", "gx", lsplinks.gx)
  end
}
