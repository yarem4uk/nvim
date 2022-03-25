local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

cmd('source ~/.config/nvim/abbreviations.vim')

g.mapleader = ' '

opt.ttyfast = true
opt.lazyredraw = true

opt.undofile = true
cmd('set undodir=~/.config/nvim/.backups')
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.wrap = true
opt.linebreak = true
opt.showcmd = true
opt.showmatch = true
opt.joinspaces = false

opt.showmode = false
opt.cursorline = true

opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true

opt.foldmethod = 'indent'
opt.foldlevelstart = 99

-- opt.t_Co=256
opt.hls = false
opt.ignorecase = true
opt.smartcase = true
opt.laststatus = 2

-- gruvbox-material
g.gruvbox_material_background = 'soft'
g.gruvbox_material_transparent_background = 1

-- ultisnips
-- g.UltiSnipsSnippetDirectories = { '~/.config/nvim/UltiSnips', 'UltiSnips' }
g.UltiSnipsUsePythonVersion = 3
-- g.UltiSnipsExpandTrigger='<c-i>'
g.UltiSnipsJumpForwardTrigger = '<c-j>'
g.UltiSnipsJumpBackwardTrigger = '<c-k>'

vim.cmd([[
  au BufNewFile,BufRead *.ejs set ft=html
  au BufNewFile,BufRead *.jsx set ft=javascript

  autocmd bufread,bufnewfile *.py setl sts=4 sw=4 tw=79 cc=79
  autocmd bufread,bufnewfile *.html setl sts=2 sw=2 tw=79
]])
