local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git',
  'clone',
  '--depth',
  '1',
  'https://github.com/wbthomason/packer.nvim',
  install_path})
end

-- Automatically run :PackerCompile whenever plug.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plug.lua source <afile> | PackerCompile
  augroup end
]])


local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)

    -- My plugins here
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tpope/vim-commentary'

    use 'lifepillar/vim-gruvbox8'
    use 'sainnhe/gruvbox-material'

    use {
      'nvim-lualine/lualine.nvim',
      -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'kyazdani42/nvim-tree.lua'
    -- use 'kyazdani42/nvim-web-devicons'

    -- telescope
    use 'nvim-telescope/telescope.nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    --null-ls
    use 'jose-elias-alvarez/null-ls.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    packer.sync()
  end
end)
