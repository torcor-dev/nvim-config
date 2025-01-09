require("mason").setup()
local config = require("mason-lspconfig")
local lsp = require("tc.lsp")

config.setup_handlers({
	function(server)
		require("lspconfig")[server].setup(lsp)
	end,
})

require("lspconfig").hls.setup({
	cmd = { "haskell-language-server-wrapper", "--lsp" },
	capabilities = lsp.capabilities,
	on_init = lsp.on_init,
	on_attach = lsp.on_attach,
	flags = lsp.flags,
})

require("lspconfig").tailwindcss.setup({
	capabilities = lsp.capabilities,
	on_init = lsp.on_init,
	on_attach = lsp.on_attach,
	flags = lsp.flags,
	filetypes = { "haskell" },
	settings = {
		tailwindCSS = {
			includeLanguages = {
				haskell = "html",
			},
		},
	},
})
