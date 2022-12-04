local buf_nmap = require("tc.helpers.keymap").wk_buf_nmap

local rt = require("rust-tools")

local TAG = "[rust-tools]"

buf_nmap({ keys = "K", action = rt.hover_actions, name = "Hover Actions", tag = TAG })
