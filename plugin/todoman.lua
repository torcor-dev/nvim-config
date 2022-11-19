require("todoman").setup({
	--save_dir = vim.fn.expand("~") .. "/doc/todo",
})

require("telescope").load_extension("todoman")
