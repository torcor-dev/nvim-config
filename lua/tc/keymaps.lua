local nmap = require("tc.helpers.keymap").wk_nmap

nmap {
  keys = "<c-j>",
  action = function() vim.cmd([[resize +10]]) end,
  "Increase h-split size", "Global"
}

nmap {
  keys = "<c-k>",
  action = function() vim.cmd([[resize -10]]) end,
  "Decrease h-split size", "Global"
}

nmap {
  keys = "<c-h>",
  action = function() vim.cmd([[vertical resize -10]]) end,
  "Decrease v-split size", "Global"
}

nmap {
  keys = "<c-l>",
  action = function() vim.cmd([[vertical resize +10]]) end,
  "Increase v-split size", "Global"
}

vim.keymap.set('', '<F2>', ':bprev<CR>', { noremap = true })
vim.keymap.set('', '<F3>', ':bnext<CR>', { noremap = true })
