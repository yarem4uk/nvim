local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
  return
end

local servers = {
        'bashls', 'pyright', 'yamlls', 'ansiblels', 'cssls', 'eslint',
        'emmet_ls', 'html', 'jsonls', 'tsserver', 'sumneko_lua',
        'dockerls', 'sqlls',
        'vimls', 'lemminx'
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

require('lsp.handlers').setup()

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('lsp.handlers').on_attach,
    capabilities = require('lsp.handlers').capabilities
  }

  if server.name == 'sumneko_lua' then
      local sumneko_opts = require 'lsp.settings.sumneko_lua'
      opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

  server:setup(opts)
end)

