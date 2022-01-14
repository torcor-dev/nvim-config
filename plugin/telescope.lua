local builtin = require('telescope.builtin')

vim.keymap.set('', '<leader><leader>', builtin.find_files, {noremap = true})
