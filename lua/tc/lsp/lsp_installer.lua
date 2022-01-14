local lsp_installer = require("nvim-lsp-installer")
local util = require("lspconfig.util")
local lsp = require('tc.lsp')

local null_ls_formatting = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

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
}

local server_opts = function(server)
  if servers[server.name] ~= nil then
    return vim.tbl_deep_extend("keep", servers[server.name], lsp)
  else
    return lsp
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = server_opts(server)
  --opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

  server:setup(opts)
end)
