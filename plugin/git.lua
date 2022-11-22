local ok, neogit = pcall(require, "neogit")
if not ok then
  return
end
local nmap = require("tc.helpers.keymap").wk_nmap

neogit.setup({
  integrations = {
    diffview = true,
  },
})

local TAG = "[Git]"

nmap({ keys = "<leader>gs", action = neogit.open, name = "Status", tag = TAG })
