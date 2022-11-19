require('refactoring').setup({})

local nmap = require('tc.helpers.keymap').wk_nmap
local map = require('tc.helpers.keymap').wk_map

local TAG = 'refactoring'

map({ 'v' },
  {
    keys = '<leader>re',
    action = [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    name = 'Extract Function',
    tag = TAG
  })

map({ 'v' },
  {
    keys = '<leader>rf',
    action = [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    name = 'Extract Function To File',
    tag = TAG
  })

map({ 'v' },
  {
    keys = '<leader>rv',
    action = [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    name = 'Extract Variable',
    tag = TAG
  })

map({ 'v' },
  {
    keys = '<leader>ri',
    action = [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    name = 'Inline Variable',
    tag = TAG
  })

nmap({
  keys = '<leader>ri',
  action = [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  name = 'Inline Variable',
  tag = TAG
})

nmap({
  keys = '<leader>rb',
  action = [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
  name = 'Extract Block',
  tag = TAG
})

nmap({
  keys = '<leader>rbf',
  action = [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
  name = 'Extract Block To File',
  tag = TAG
})

--[[map({ 'v' },
  {
    keys = '<leader>re',
    action = function()
      require('refactoring').refactor('Extract Function')
    end,
    name = 'Extract Function',
    tag = TAG
  })

map({ 'v' },
  {
    keys = '<leader>rf',
    action = function()
      require('refactoring').refactor('Extract Function To File')
    end,
    name = 'Extract Function To File',
    tag = TAG
  })

map({ 'v' },
  {
    keys = '<leader>rv',
    action = function()
      require('refactoring').refactor('Extract Variable')
    end,
    name = 'Extract Variable',
    tag = TAG
  })

map({ 'v' },
  {
    keys = '<leader>ri',
    action = function()
      require('refactoring').refactor('Inline Variable')
    end,
    name = 'Inline Variable',
    tag = TAG
  })

nmap({
  keys = '<leader>ri',
  action = function()
    require('refactoring').refactor('Inline Variable')
  end,
  name = 'Inline Variable',
  tag = TAG
})

nmap({
  keys = '<leader>rb',
  action = function()
    require('refactoring').refactor('Extract Block')
  end,
  name = 'Extract Block',
  tag = TAG
})

nmap({
  keys = '<leader>rbf',
  action = function()
    require('refactoring').refactor('Extract Block To File')
  end,
  name = 'Extract Block To File',
  tag = TAG
})]]
