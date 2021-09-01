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
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }

    -- Dependencies
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'


    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'p00f/nvim-ts-rainbow'

    -- LSP & Autocomplete
    -- use { "hrsh7th/nvim-cmp", requires = { "hrsh7th/vim-vsnip", "hrsh7th/cmp-buffer" } }

    -- Motions
    use 'nacro90/numb.nvim'
    use 'easymotion/vim-easymotion'
    use 'kevinhwang91/nvim-hlslens'

    -- UI
    use 'romgrk/barbar.nvim'
    use 'hoob3rt/lualine.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'luochen1990/rainbow'

    -- Theme
    use 'sainnhe/gruvbox-material'

    -- General plugins
    use 'mhinz/vim-startify'
    use 'b3nj5m1n/kommentary'
    use 'jeffkreeftmeijer/vim-numbertoggle'
    use 'steelsojka/pears.nvim'
    use 'w0rp/ale'

    use 'skywind3000/asyncrun.vim'
    use 'kien/ctrlp.vim'
    use 'pseewald/vim-anyfold'
    use 'dstein64/vim-startuptime'
    use { "blackCauldron7/surround.nvim", config = function() require "surround".setup {} end }
    use 'rhysd/vim-clang-format'
    use 'mbbill/undotree'
end }
