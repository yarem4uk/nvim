local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--local map = vim.api.nvim_set_keymap
--local default = { noremap = true, silent = true }

local silent = { silent = true }

map('', '<leader><leader>', '<C-^>', silent)

map('i', '<up>', '<NOP>', silent)
map('i', '<down>', '<NOP>',  silent)
map('i', '<left>', '<NOP>', silent)
map('i', '<right>', '<NOP>', silent)
map('i', '<bs>', '<NOP>', silent)

map('c', '<up>', '<NOP>', silent)
map('c', '<down>', '<NOP>',  silent)
map('c', '<left>', '<NOP>', silent)
map('c', '<right>', '<NOP>', silent)
map('c', '<bs>', '<NOP>', silent)

map('c', '<c-k>', '<Up>', {})
map('c', '<c-j>', '<Down>', {})

map('', '<up>', '<NOP>', silent)
map('', '<down>', '<NOP>',  silent)
map('', '<left>', '<NOP>', silent)
map('', '<right>', '<NOP>', silent)
map('', '<bs>', '<NOP>', silent)

map('v', '<leader>y', ':w! ~/.vbuf<cr>', silent)
map('', '<leader>y', ':.w! ~/.vbuf<cr>', silent)
map('', '<leader>p', ':r ~/.vbuf<cr>', silent)


map('i', ',w', '<esc>:w<cr>', silent)
map('', ',w', ':w<cr>', silent)

map('', '<leader>q', ':q!<cr>', silent)
map('', '<leader>o', ':only<cr>', silent)

map('o', 'im', 'i[', silent)

map('', [[']], [[`]], silent)
map('', [[`]], [[']], silent)

map('v', '"y', '"*y', silent)
map('n', '"y', '"*y', silent)
map('n', '"p', '"*p', silent)

--Map ctrl-movement keys to window switching

map('', 'Y', 'y$', silent)

map('', '<C-k>', '<C-w><Up>', silent)
map('', '<C-j>', '<C-w><Down>', silent)
map('', '<C-l>', '<C-w><Right>', silent)
map('', '<C-h>', '<C-w><Left>', silent)

map('n', [[<C-\>]],
"<cmd>lua require('user.telescope').find_vim_dot_files() <cr>",
  silent)
map('', ';f', ':Telescope find_files<cr>', silent)
map('', ';r', ':Telescope live_grep<cr>', silent)
map('', ';;', ':Telescope buffers<cr>', silent)
-- map('', ';;', ':Telescope help_tags<cr>', silent)
-- map('', '<C-p>', ':Telescope find_files<cr>', silent)
-- map('', '<leader>g', ':Telescope live_grep<cr>', silent)

map('n', ',,', ':NvimTreeToggle<cr>', silent)
map('n', '<leader>,', ':NvimTreeFindFile<cr>', silent)
