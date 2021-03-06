local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {

  -- js
  formatting.prettier,
  diagnostics.eslint,
  code_actions.eslint,

  -- python
  formatting.black.with({
    extra_args = { '--fast', '-l', 79 },
  }),
  diagnostics.flake8,

  -- lua
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
}

null_ls.setup({
  debug = false,
  sources = sources,
})
