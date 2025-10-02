local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup("HighlightYank", {})
local fmt_onsave_group = augroup("FmtOnSave", {})
-- 22016534327
-- compile Packer file automatically
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

autocmd("BufWritePre", {
	group = fmt_onsave_group,
	pattern = { "*.go", "*.lua" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

autocmd("FileType", {
	callback = function(details)
		local bufnr = details.buf
		if not pcall(vim.treesitter.start, bufnr) then -- try to start treesitter which enables syntax highlighting
			return -- Exit if treesitter was unable to start
		end
		vim.bo[bufnr].syntax = "on" -- Use regex based syntax-highlighting as fallback as some plugins might need it
		vim.wo.foldlevel = 99
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folds
		vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Use treesitter for indentation
	end,
})
