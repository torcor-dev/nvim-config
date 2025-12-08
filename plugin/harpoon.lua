local harpoon = require("harpoon")
local nmap = require("tc.helpers.keymap").wk_nmap

harpoon:setup()

local TAG = "[Harpoon]"

local function leader_h(key)
	return "<leader>h" .. key
end

local function select(n)
	harpoon:list():select(n)
end

local function add()
	harpoon:list():add()
end

local function next()
	harpoon:list():next()
end

local function quick_menu()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end

local function prev()
	harpoon:list():prev()
end

local function select1()
	select(1)
end
local function select2()
	select(2)
end
local function select3()
	select(3)
end
local function select4()
	select(4)
end

nmap({ keys = leader_h("b"), action = quick_menu, name = "List buffers", tag = TAG })
nmap({ keys = leader_h("a"), action = add, name = "Add buffer", tag = TAG })
nmap({ keys = leader_h("1"), action = select1, name = "Goto 1", tag = TAG })
nmap({ keys = leader_h("2"), action = select2, name = "Goto 2", tag = TAG })
nmap({ keys = leader_h("3"), action = select3, name = "Goto 3", tag = TAG })
nmap({ keys = leader_h("4"), action = select4, name = "Goto 4", tag = TAG })
nmap({ keys = leader_h("p"), action = prev, name = "Goto prev", tag = TAG })
nmap({ keys = leader_h("n"), action = next, name = "Goto next", tag = TAG })
