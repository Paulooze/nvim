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
  "nvim-tree/nvim-tree.lua",
  config = function()
    require('nvim-tree').setup({
      diagnostics = {
        enable = true
      },
      on_attach = nvim_tree_on_attach
    })
  end
}
