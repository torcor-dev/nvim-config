local add_cmd = require("tc.helpers.cmd").add_cmd

add_cmd("TODO", require("todoman").todo)
