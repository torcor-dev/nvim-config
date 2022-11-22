local gitsigns = require('gitsigns')

gitsigns.setup()


local nmap = require("tc.helpers.keymap").wk_nmap
local map = require("tc.helpers.keymap").wk_map

local TAG = "[Git]"

nmap {
  keys = "<leader>gp",
  action = function()
    gitsigns.preview_hunk()
  end,
  name = "Preview hunk",
  tag = TAG
}

nmap {
  keys = "<leader>gb",
  action = function()
    gitsigns.blame_line()
  end,
  name = "Git blame line",
  tag = TAG
}

local HUNK_TAG = "[Git Hunks]"

nmap {
  keys = "<leader>gh",
  action = function() end,
  name = "Hunk staging",
  tag = HUNK_TAG
}

nmap {
  keys = "<leader>ghn",
  action = function()
    gitsigns.next_hunk()
  end,
  name = "Go to next hunk",
  tag = TAG
}

nmap {
  keys = "<leader>ghp",
  action = function()
    gitsigns.prev_hunk()
  end,
  name = "Go to previous hunk",
  tag = TAG
}

nmap {
  keys = "<leader>ghs",
  action = function()
    gitsigns.stage_hunk()
  end,
  name = "Stage hunk",
  tag = HUNK_TAG
}

nmap {
  keys = "<leader>ghr",
  action = function()
    gitsigns.reset_hunk()
  end,
  name = "Reset hunk",
  tag = HUNK_TAG
}

nmap {
  keys = "<leader>ghu",
  action = function()
    gitsigns.undo_stage_hunk()
  end,
  name = "Undo stage hunk",
  tag = HUNK_TAG
}


local TOGGLE_TAG = "[Git Toggles]"

nmap {
  keys = "<leader>gt",
  action = function() end,
  name = "Toggles",
  tag = TOGGLE_TAG
}

nmap {
  keys = "<leader>gtb",
  action = function()
    gitsigns.toggle_current_line_blame()
  end,
  name = "Toggles blame line",
  tag = TOGGLE_TAG
}

nmap {
  keys = "<leader>gtd",
  action = function()
    gitsigns.toggle_deleted()
  end,
  name = "Toggles deleted",
  tag = TOGGLE_TAG
}

nmap {
  keys = "<leader>gtw",
  action = function()
    gitsigns.toggle_word_diff()
  end,
  name = "Toggles word diff",
  tag = TOGGLE_TAG
}

nmap {
  keys = "<leader>gth",
  action = function()
    gitsigns.toggle_linehl()
  end,
  name = "Toggles line highlight",
  tag = TOGGLE_TAG
}

nmap {
  keys = "<leader>gts",
  action = function()
    gitsigns.toggle_signs()
  end,
  name = "Toggles signs",
  tag = TOGGLE_TAG
}
