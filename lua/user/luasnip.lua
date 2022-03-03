-- if vim.g.snippets ~= 'luasnip' then
--   return
-- end

local status_ok, ls = pcall(require, 'luasnip')
if not status_ok then
  return
end

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = ls.restore_node
local f = ls.function_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

ls.config.set_config({
  -- history = true,

  updateevents = 'TextChanged, TextChangedI',

  enable_autosnippets = true,
})

vim.cmd([[
  imap <silent><expr> <c-i> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-i>'
  imap <silent><expr> <c-k>  luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev': '<c-k>'
]])

-- vim.keymap.set({ 'i', 's' }, '<c-i>', function()
--   if ls.expand_or_jumpable() then
--     ls.expand_or_jump()
--   end
-- end, { silent = true })

-- vim.keymap.set({ "i", "s" }, "<c-k>", function()
--   if ls.jumpable(-1) then
--     ls.jump(-1)
--   end
-- end, { silent = true })
ls.snippets = {
  all = {
    s('cond', {
      t('first'),
      i(1, 'def'),
      t('second'),
    }, {
      -- function(line_to_cursor, matched_trigger, captures)
      condition = function(line_to_cursor)
        -- optional whitespace followed by //
        return line_to_cursor:match('%w*')
        -- return line_to_cursor:match('aaa')
      end,
    }),
  },
  lua = {
    s('req', fmt("local {} = require('{}')\n{}", { i(1, 'default'), rep(1), i(0) })),
  },
}
ls.autosnippets = {
  all = {
    s({ trig = 'jj', wordTrig = false }, { t('('), i(1), t(')') }),
    s({ trig = '[^ou]?mm', wordTrig = false, regTrig = true }, { t('['), i(1), t(']'), i(0) }),
  },
  lua = {
    s({ trig = 'cmm', wordTrig = false, regTrig = true }, { t('[['), i(1), t(']]') }),
  },
}
