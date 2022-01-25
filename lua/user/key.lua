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
map('i', '<down>', '<NOP>', silent)
map('i', '<left>', '<NOP>', silent)
map('i', '<right>', '<NOP>', silent)
map('i', '<bs>', '<NOP>', silent)

map('c', '<up>', '<NOP>', silent)
map('c', '<down>', '<NOP>', silent)
map('c', '<left>', '<NOP>', silent)
map('c', '<right>', '<NOP>', silent)
map('c', '<bs>', '<NOP>', silent)

map('c', '<c-k>', '<Up>', {})
map('c', '<c-j>', '<Down>', {})

map('', '<up>', '<NOP>', silent)
map('', '<down>', '<NOP>', silent)
map('', '<left>', '<NOP>', silent)
map('', '<right>', '<NOP>', silent)
map('', '<bs>', '<NOP>', silent)


map('i', ',w', '<esc>:w<cr>', silent)
map('', ',w', ':w<cr>', silent)

-- COMMAND MAPPING

map('', [[']], [[`]], silent)
map('', [[`]], [[']], silent)

map('n', 'k', 'gk', silent)
map('n', 'gk', 'k', silent)
map('n', 'j', 'gj', silent)
map('n', 'gj', 'j', silent)


map('v', '"y', '"*y', silent)
map('n', '"y', '"*y', silent)
map('n', '"p', '"*p', silent)

map('', 'Y', 'y$', silent)

-- Make Ctrl-e jump to the end of the line in the insert mode.
map('', '<C-k>', '<C-w><Up>', silent)
map('', '<C-j>', '<C-w><Down>', silent)
map('', '<C-l>', '<C-w><Right>', silent)
map('', '<C-h>', '<C-w><Left>', silent)



map('', ';f', ':Telescope find_files<cr>', silent)
map('', ';r', ':Telescope live_grep<cr>', silent)
map('', ';b', ':Telescope buffers<cr>', silent)

-- open luavim files by telescope
map('n', [[<C-\>]], "<cmd>lua require('user.telescope').find_vim_dot_files()<cr>", silent)


map('n', ',,', ':NvimTreeToggle<cr>', silent)
map('n', '<leader>,', ':NvimTreeFindFile<cr>', silent)

--movement
map('o', 'im', 'i[', silent)
map('o', 'in', ':<c-u>normal! f(vi(<cr>', silent)
map('o', 'il', ':<c-u>normal! F)vi(<cr>', silent)

map('i', 'AA', '<esc>A', silent)
map('i', 'II', '<esc>I', silent)

-- LEADER MAPING

-- upper/lower word
map('n', '<leader>u', [[mQviwU'Q]], silent)
map('n', '<leader>l', [[mQviwu'Q]], silent)

-- formatting
map('n', '<leader>f', ':Format<cr>', silent)

map('v', '<leader>y', ':w! ~/.vbuf<cr>', silent)
map('', '<leader>y', ':.w! ~/.vbuf<cr>', silent)
map('', '<leader>p', ':r ~/.vbuf<cr>', silent)

map('', '<leader>q', ':q!<cr>', silent)
map('', '<leader>o', ':only<cr>', silent)


-- Quickly select the text I just pasted.
map('n', 'gV', '`[v`]', silent)
