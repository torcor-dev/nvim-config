vim.g.loaded_matchparen = 1

local opt = vim.opt

opt.clipboard = 'unnamedplus'
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 15

require('onedark').setup()
