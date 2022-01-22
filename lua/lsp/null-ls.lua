local status_ok, null_ls = pcall(require, 'null_ls')
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
  -- formatting.builtins.formatting.stylua,
  -- builtins.diagnostics.eslint,

  -- builtins.completion.spell,
  formatting.stylua
  },
})
