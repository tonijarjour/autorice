return require('packer').startup(function(use)
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'windwp/nvim-autopairs'
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', 
    requires = {{ 'nvim-lua/plenary.nvim' }}}
end)
