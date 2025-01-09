local trouble = require("trouble")
trouble.setup()

local nmap = require("tc.helpers.keymap").wk_nmap

nmap({ keys = "<leader>xx", action = "<cmd>Trouble diagnostics toggle<cr>", name = "Trouble", tag = "Diagnostics" })
