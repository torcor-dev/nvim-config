if not pcall(require, "nvim-treesitter") then
	return
end

require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "typescript", "rust", "python" },
	sync_install = false,

	ignore_install = { "phpdoc" },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
