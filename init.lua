if require('tc.first_load')() then
	return
end

vim.g.mapleader = ' '

vim.keymap.set('', '<F2>', ':bprev<CR>', {noremap = true})
vim.keymap.set('', '<F3>', ':bnext<CR>', {noremap = true})

require('options')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require('tc.plugins')
require('tc.lsp.lsp_installer')
