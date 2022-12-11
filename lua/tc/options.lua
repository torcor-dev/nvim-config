--opt.clipboard = 'unnamedplus'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.scrolloff = 15
vim.opt.showmatch = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "0"
vim.opt.timeoutlen = 500
vim.opt.cursorline = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

if os.getenv("USER") == "fu" then
	vim.cmd("colorscheme pinkbones")
	vim.cmd("highlight Normal guibg=none")
else
	vim.cmd("colorscheme tokyonight")
end
