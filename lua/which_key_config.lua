local wk = require("whichkey_setup")
local keymap = {
    z = {
	name = "folds",
	c = {'zc', "close fold"},
	f = {'zf', "create fold"},
	o = {'zo', "open fold"},
	d = {'zd', "delete fold"},
        r = {'zr', "open all folds"},
        m = {'zm', "close all folds"},
        j = {'zj', "move down to start of next fold"},
        k = {'zk', "move up to end of previous fold"},
	}
    }
wk.register_keymap('leader', keymap)
