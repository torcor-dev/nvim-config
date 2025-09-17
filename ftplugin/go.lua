local buf_nmap = require("tc.helpers.keymap").wk_buf_nmap

local TEST_TAG = "[Go Test]"

-- Wrapper functions that clear quickfix before running tests
local function clear_and_test_file()
  vim.cmd("cexpr []")
  vim.cmd("GoTestFile")
end

local function clear_and_test_func()
  vim.cmd("cexpr []")
  vim.cmd("GoTestFunc")
end

local function clear_and_test_all()
  vim.cmd("cexpr []")
  vim.cmd("GoTest")
end

local function clear_and_test_pkg()
  vim.cmd("cexpr []")
  vim.cmd("GoTestPkg")
end

-- Test functions
buf_nmap({ keys = "<leader>tf", action = clear_and_test_file, name = "Test file", tag = TEST_TAG })
buf_nmap({ keys = "<leader>tn", action = clear_and_test_func, name = "Test nearest", tag = TEST_TAG })
buf_nmap({ keys = "<leader>ta", action = clear_and_test_all, name = "Test all", tag = TEST_TAG })
buf_nmap({ keys = "<leader>tl", action = clear_and_test_pkg, name = "Test package", tag = TEST_TAG })
buf_nmap({ keys = "<leader>tc", action = ":GoCoverage<CR>", name = "Test coverage", tag = TEST_TAG })

-- Additional Go commands
buf_nmap({ keys = "<leader>gr", action = ":GoRun<CR>", name = "Run", tag = "[Go]" })
buf_nmap({ keys = "<leader>gb", action = ":GoBuild<CR>", name = "Build", tag = "[Go]" })
buf_nmap({ keys = "<leader>gi", action = ":GoImport ", name = "Import package", tag = "[Go]" })
buf_nmap({ keys = "<leader>gf", action = ":GoFmt<CR>", name = "Format", tag = "[Go]" })