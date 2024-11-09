local nmap = require("tc.helpers.keymap").wk_nmap
local map = require("tc.helpers.keymap").wk_map

local split_tag = "[Split]"
nmap({
	keys = "<c-j>",
	action = function()
		vim.cmd([[resize +10]])
	end,
	name = "Increase h-split size",
	tag = split_tag,
})

nmap({
	keys = "<c-k>",
	action = function()
		vim.cmd([[resize -10]])
	end,
	name = "Decrease h-split size",
	tag = split_tag,
})

nmap({
	keys = "<c-h>",
	action = function()
		vim.cmd([[vertical resize -10]])
	end,
	name = "Decrease v-split size",
	tag = split_tag,
})

nmap({
	keys = "<c-l>",
	action = function()
		vim.cmd([[vertical resize +10]])
	end,
	name = "Increase v-split size",
	tag = split_tag,
})

nmap({
	keys = "<leader>ex",
	action = function()
		local function f()
			vim.cmd([[Rexplore]])
		end

		if not pcall(f) then
			vim.cmd([[Explore]])
		end
	end,
	name = "Explore",
	tag = "netrw",
})

-- GROUPS
local function l(k)
	return "<leader>" .. k
end
local group = require("tc.helpers.keymap").wk_group

group(l("f"), "Find")
group(l("c"), "Code Actions")
group(l("d"), "Debug")
group(l("e"), "Explore")
group(l("g"), "Git")
group(l("q"), "Quickfix")
group(l("r"), "Refactoring")
group(l("t"), "Terminal")
group(l("x"), "Trouble")

local CLIP_TAG = "[Clip]"
map({ "n", "v" }, { keys = l("y"), name = '"+y  ', action = '"+y', tag = CLIP_TAG })
map({ "n", "v" }, { keys = l("Y"), name = '"+Y  ', action = '"+Y', tag = CLIP_TAG })
map({ "x" }, { keys = l("p"), name = '"_dP ', action = '"_dP', tag = CLIP_TAG })
map({ "n", "v" }, { keys = l("P"), name = '"+p ', action = '"+p', tag = CLIP_TAG })

vim.keymap.set("", "<F2>", ":bprev<CR>", { noremap = true })
vim.keymap.set("", "<F3>", ":bnext<CR>", { noremap = true })
