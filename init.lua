require('user.set')
require('user.key')
require('user.plug')

require('user.lualine')


require('user.telescope')
require('user.colorsheme')
require('user.nvimtree')
require('user.treesitter')
require('user.cmp')
require('lsp.lspconfig')

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end



-- dump({vim.opt.statusline})
-- vim.opt.statusline = [[%Y]]

