local opt = vim.opt
opt.clipboard = 'unnamedplus'
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 15
opt.showmatch = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

if os.getenv("USER") == "fu" then
  vim.cmd('colorscheme pinkbones')
  vim.cmd('highlight Normal guibg=none')
else
  vim.cmd('colorscheme nord')
end
