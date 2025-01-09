local nmap = require("tc.helpers.keymap").wk_nmap

vim.diagnostic.config({
	underline = true,
	virtual_text = {
		severity = nil,
		source = "if_many",
		format = nil,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰛨",
			[vim.diagnostic.severity.INFO] = "",
		},
	},

	-- options for floating windows:
	float = {
		show_header = true,
	},

	-- general purpose
	severity_sort = true,
	update_in_insert = false,
})

local goto_opts = {
	wrap = true,
	float = true,
}

local TAG = "Diagnostic"

nmap({
	keys = "<leader>dn",
	action = function()
		vim.diagnostic.goto_next(goto_opts)
	end,
	name = "Diagnostic: Next",
	tag = TAG,
})

nmap({
	keys = "<leader>dp",
	action = function()
		vim.diagnostic.goto_prev(goto_opts)
	end,
	name = "Diagnostic: Prev",
	tag = TAG,
})

nmap({
	keys = "<leader>dl",
	action = function()
		vim.diagnostic.open_float(0, {
			scope = "line",
		})
	end,
	name = "Diagnostic: Line",
	tag = TAG,
})
