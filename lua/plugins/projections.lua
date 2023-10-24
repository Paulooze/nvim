return {
  'gnikdroy/projections.nvim',
  config = function()
    require("projections").setup({
      workspaces = {
        { "~/Projects", { ".git", "package.json" } }
      }
    })
    require("telescope").load_extension("projections")
    vim.keymap.set("n", "<leader>o", function() vim.cmd("Telescope projections") end)

    local Session = require("projections.session")
    vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
      callback = function() Session.store(vim.loop.cwd()) end,
    })

    local switcher = require("projections.switcher")
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function()
        if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
      end,
    })
  end
}
