vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.suda_smart_edit = 1

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  import = 'plugins',
  ui = { border = 'rounded', size = { width = 0.8, height = 0.8 } }
})

if vim.g.neovide then
  vim.o.guifont = 'CaskaydiaCove Nerd Font Mono:h12'
  vim.g.neovide_refresh_rate = 90
end

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.wo.number = true
vim.opt.cursorline = true
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'',
               { expr = true, silent = true })
vim.keymap.set('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'',
               { expr = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

vim.api.nvim_create_user_command('BufferKill', function()
  require('utils.buffers').buf_kill('bd')
end, { force = true })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'Search', timeout = 100 })
  end,
  group = highlight_group,
  pattern = '*'
})
