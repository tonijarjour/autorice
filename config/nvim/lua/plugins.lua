return require('packer').startup(function()
    use {"catppuccin/nvim", as = "catppuccin"}
    use 'windwp/nvim-autopairs'
    use {'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
end)
