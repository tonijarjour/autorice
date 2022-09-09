require('settings')
require('plugins')
require('keymaps')

vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]

require('nvim-autopairs').setup()
require('lualine').setup()
require('bufferline').setup {
    options = {show_close_icon  = false, show_buffer_close_icons  = false}}
require('nvim-treesitter.configs').setup {
    ensure_installed = {'bash'},
    highlight = {enable = true}}
