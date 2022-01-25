local M = {}

M.setup = function()
  local signs = {

    { name = 'DiagnosticSignError', text = '✗ ' },
    { name = 'DiagnosticSignWarn', text = 'ί ' },
    { name = 'DiagnosticSignHint', text = 'h ' },
    { name = 'DiagnosticSignInfo', text = '? ' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  --   border = "rounded",
  -- })

  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  --   border = "rounded",
  -- })
end

M.keymap = function(bufnr)
  -- local buf_map = function (...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  -- buf_map(bufnr, 'n', 'gD',    '<cmd>lua vim.lsp.buf.declaration()<cr>',    opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',    '<cmd>lua vim.lsp.buf.declaration()<cr>',    opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',    '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[r', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']r', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(_, bufnr)
  M.keymap(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
