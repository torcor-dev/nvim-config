local nmap = require("tc.helpers.keymap").wk_buf_nmap
local map = require("tc.helpers.keymap").wk_map

require("nvim-treesitter-textobjects").setup({
	select = {
		-- Automatically jump forward to textobj, similar to targets.vim
		lookahead = true,
		-- You can choose the select mode (default is charwise 'v')
		--
		-- Can also be a function which gets passed a table with the keys
		-- * query_string: eg '@function.inner'
		-- * method: eg 'v' or 'o'
		-- and should return the mode ('v', 'V', or '<c-v>') or a table
		-- mapping query_strings to modes.
		selection_modes = {
			["@parameter.outer"] = "v", -- charwise
			["@function.outer"] = "V", -- linewise
			["@class.outer"] = "<c-v>", -- blockwise
		},
		-- If you set this to `true` (default is `false`) then any textobject is
		-- extended to include preceding or succeeding whitespace. Succeeding
		-- whitespace has priority in order to act similarly to eg the built-in
		-- `ap`.
		--
		-- Can also be a function which gets passed a table with the keys
		-- * query_string: eg '@function.inner'
		-- * selection_mode: eg 'v'
		-- and should return true of false
		include_surrounding_whitespace = false,
		move = {
			-- whether to set jumps in the jumplist
			set_jumps = true,
		},
	},
})

local TAG = "[treesitter]"
-- keymaps
-- You can use the capture groups defined in `textobjects.scm`
map({ "x", "o" }, {
	keys = "af",
	name = "around function",
	action = function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
	end,
	tag = TAG,
})

map({ "x", "o" }, {
	keys = "if",
	name = "in function",
	action = function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
	end,
	tag = TAG,
})

map({ "x", "o" }, {
	keys = "ac",
	name = "around class",
	action = function()
		require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
	end,
	tag = TAG,
})

map({ "x", "o" }, {
	keys = "ic",
	name = "in class",
	action = function()
		require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
	end,
	tag = TAG,
})

nmap({
	keys = "<leader>n",
	name = "swap parameter right",
	action = function()
		require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
	end,
	tag = TAG,
})

nmap({
	keys = "<leader>N",
	name = "swap parameter left",
	action = function()
		require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
	end,
	tag = TAG,
})

map({ "n", "x", "o" }, {
	keys = "]f",
	name = "next function",
	action = function()
		require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
	end,
	tag = TAG,
})

map({ "n", "x", "o" }, {
	keys = "[f",
	name = "previous function",
	action = function()
		require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
	end,
	tag = TAG,
})

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

map({ "n", "x", "o" }, {
	keys = ";",
	name = "repeat last move next",
	action = ts_repeat_move.repeat_last_move_next,
	tag = TAG,
})

map({ "n", "x", "o" }, {
	keys = ",",
	name = "repeat last move previous",
	action = ts_repeat_move.repeat_last_move_previous,
	tag = TAG,
})

-- Dont want to tag or name these
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
