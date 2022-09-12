local add_cmd = require('tc.helpers.cmd').add_cmd

add_cmd("Socfg", vim.cmd([[source $HOME/.config/nvim/init.lua]]))
