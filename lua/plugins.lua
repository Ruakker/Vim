local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

-- Check if packer exist 
if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  print("Downloading packer.nvim...")
  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloaded packer.nvim")
  print("Reopen NVIM and run :PackerSync twice")

  return
end

return require('packer').startup {
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    -- Dependencies
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'


    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-telescope/telescope.nvim'

    -- Motions
    use 'nacro90/numb.nvim'
    use 'kevinhwang91/nvim-hlslens'
    use { 'phaazon/hop.nvim', as = 'hop',
      config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }

    -- UI
    use 'hoob3rt/lualine.nvim'
    use 'kdheepak/tabline.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'rmagatti/auto-session'

    -- Theme
    use 'sainnhe/gruvbox-material'

    -- General plugins
    use 'b3nj5m1n/kommentary'
    use 'jeffkreeftmeijer/vim-numbertoggle'
    use { 'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup{}
      end
    }
    use 'w0rp/ale'

    use 'skywind3000/asyncrun.vim'
    use 'dstein64/vim-startuptime'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'rhysd/vim-clang-format'
    use 'mbbill/undotree'
  end
}
