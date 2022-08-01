require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")
local lsp = require('tc.lsp')

-- local null_ls_formatting = function(client)
--   client.server_capabilities.document_formatting = false
--   client.server_capabilities.document_range_formatting = false
-- end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local servers = {
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = runtime_path },
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  },
  pyright = {},
  gopls = {},
  omnisharp = {},
  tsserver = {},
  tailwindcss = {},
  jsonls = {},
}

for name, config in pairs(servers) do
  for k, v in pairs(lsp) do
    config[k] = v
  end
  lspconfig[name].setup(config)
end
