return {
  'backdround/improved-search.nvim',
  config = function()
    local search = require('improved-search')

    vim.keymap.set({ 'n', 'x', 'o' }, 'n', search.stable_next)
    vim.keymap.set({ 'n', 'x', 'o' }, 'N', search.stable_previous)
    vim.keymap.set("n", "!", search.current_word)
    vim.keymap.set("x", "*", search.forward)
    vim.keymap.set("x", "#", search.backward)
  end
}
