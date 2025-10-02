local neotest = require("neotest")
local nmap = require("tc.helpers.keymap").wk_buf_nmap

local TAG = "[Neotest]"

local function leader_t(key)
	return "<leader>t" .. key
end

local function run_nearest()
	return neotest.run.run()
end

local function run_file()
	return neotest.run.run(vim.fn.expand("%"))
end

local function run_suite()
	return neotest.run.run({ suite = true })
end

local function toggle_output_panel()
	return neotest.output_panel.toggle()
end

local function open_output_window()
	return neotest.output.open({ enter = true, auto_close = true })
end

local function toggle_summary()
	return neotest.summary.toggle()
end

local function stop()
	return neotest.run.stop()
end

local function run_last()
	require("neotest").run.run_last()
end

nmap({ keys = leader_t("n"), action = run_nearest, name = "Run nearest", tag = TAG })
nmap({ keys = leader_t("e"), action = run_nearest, name = "Run nearest", tag = TAG })
nmap({ keys = leader_t("f"), action = run_file, name = "Run file", tag = TAG })
nmap({ keys = leader_t("a"), action = run_suite, name = "Run all", tag = TAG })
nmap({ keys = leader_t("p"), action = toggle_output_panel, name = "Toggle output panel", tag = TAG })
nmap({ keys = leader_t("o"), action = open_output_window, name = "Open output window", tag = TAG })
nmap({ keys = leader_t("s"), action = toggle_summary, name = "Toggle summary", tag = TAG })
nmap({ keys = leader_t("x"), action = stop, name = "Stop tests", tag = TAG })
nmap({ keys = leader_t("l"), action = run_last, name = "Re-run last", tag = TAG })

nmap({
	keys = "[t",
	action = function()
		require("neotest").jump.prev({ status = "failed" })
	end,
	name = "Previous failed test",
	tag = TAG,
})
nmap({
	keys = "]t",
	action = function()
		require("neotest").jump.next({ status = "failed" })
	end,
	name = "Next failed test",
	tag = TAG,
})
