local nmap = require("tc.helpers.keymap").wk_nmap

local split_tag = "[Split]"
nmap {
  keys = "<c-j>",
  action = function() vim.cmd([[resize +10]]) end,
  name = "Increase h-split size",
  tag = split_tag
}

nmap {
  keys = "<c-k>",
  action = function() vim.cmd([[resize -10]]) end,
  name = "Decrease h-split size",
  tag = split_tag
}

nmap {
  keys = "<c-h>",
  action = function() vim.cmd([[vertical resize -10]]) end,
  name = "Decrease v-split size",
  tag = split_tag
}

nmap {
  keys = "<c-l>",
  action = function() vim.cmd([[vertical resize +10]]) end,
  name = "Increase v-split size",
  tag = split_tag
}

nmap {
  keys = "<leader>ex",
  action = function()
    local function f ()
      vim.cmd([[Rexplore]])
    end

    if not pcall(f) then
      vim.cmd([[Explore]])
    end
  end,
  name = "Explore",
  tag = "netrw"
}


vim.keymap.set('', '<F2>', ':bprev<CR>', { noremap = true })
vim.keymap.set('', '<F3>', ':bnext<CR>', { noremap = true })
