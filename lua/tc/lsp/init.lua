local imap = require('tc.helpers.keymap').imap
local nmap = require('tc.helpers.keymap').nmap
local telescope = require('telescope.builtin')

local nvim_status = require('lsp-status')
local status = require('tc.lsp.status')
status.activate()

local buf_nnoremap = function(opts)
  opts.buffer = 0
  nmap(opts)
end

local buf_inoremap = function(opts)
  opts.buffer = 0
  imap(opts)
end


local doc_diagnostics = function()
  telescope.diagnostics({bufnr=0})
end

local ws_diagnostics = function()
  telescope.diagnostics()
end


local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client)
  nvim_status.on_attach(client)

  buf_inoremap { '<c-s>', vim.lsp.buf.signature_help }
  buf_nnoremap { '<leader>cr', vim.lsp.buf.rename }
  buf_nnoremap { '<leader>ca', telescope.lsp_code_actions }

  buf_nnoremap { 'gd', vim.lsp.buf.definition }
  buf_nnoremap { 'gD', vim.lsp.buf.declaration }
  buf_nnoremap { 'gT', vim.lsp.buf.type_definition }

  buf_nnoremap { 'gr', telescope.lsp_references }
  buf_nnoremap { 'gI', telescope.lsp_implementations }
  buf_nnoremap { '<leader>fd', doc_diagnostics }
  buf_nnoremap { '<leader>fw', ws_diagnostics }

  buf_nnoremap { 'K', vim.lsp.buf.hover }

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.resolved_capabilities.code_lens and false then
    vim.cmd [[
      augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
        autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
      augroup END
    ]]
  end
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
  flags = {
    debounce_text_changes = 50,
  }
}
