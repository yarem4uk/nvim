local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = ' '

opt.ttyfast = true
opt.lazyredraw = true

opt.undofile = true
cmd 'set undodir=~/.config/nvim/.backups'
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
opt.softtabstop=2
opt.shiftwidth=2
opt.autoindent = true
opt.smartindent = true

-- opt.t_Co=256
opt.hls = false
opt.ignorecase = true
opt.smartcase = true
opt.laststatus = 2

-- gruvbox-material
g.gruvbox_material_background = 'soft'
g.gruvbox_material_transparent_background = 1


vim.cmd([[
  autocmd bufread,bufnewfile *.py setl sts=4 sw=4 tw=79 cc=79
  autocmd bufread,bufnewfile *.html setl sts=2 sw=2 tw=79
]])
