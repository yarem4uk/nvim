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

local M = {}

M.auto = function()
  return {
    s({ trig = 'jj', wordTrig = false }, { t('('), i(1), t(')') }),
    s({ trig = '[^ou]?mm', wordTrig = false, regTrig = true }, { t('['), i(1), t(']'), i(0) }),
    s({ trig = 'MM', wordTrig = false, regTrig = true }, { t('{ '), i(1), t(' }'), i(0) }),
  }
end

return M
