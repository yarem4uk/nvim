local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  -- formatting.builtins.formatting.stylua,
  -- builtins.diagnostics.eslint,

  -- builtins.completion.spell,

  formatting.stylua.with({
    extra_args = {
      '--indent-type',
      'Spaces',
      '--indent-width',
      2,
      '--quote-style',
      'AutoPreferSingle',
      '--line-endings',
      'Unix',
    },
  }),
  -- extra_args = { '--config-path', vim.fn.expand('~/.config/nvim/stylua.toml') },
}

null_ls.setup({
  -- debug = false,
  sources = sources,
})
