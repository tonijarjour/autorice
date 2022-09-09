local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ' '
keymap('n', 'Q', 'q', {noremap=true})
-- Yank to clipboard
keymap('v', '<Leader>y', '"+y<cr>', {})
-- Navigate buffers
keymap('n', '<Leader>l', '<cmd>BufferLinePick<cr>', {})
keymap('n', '<Leader>n', '<cmd>BufferLineCycleNext<cr>', {})
keymap('n', '<Leader>p', '<cmd>BufferLineCyclePrev<cr>', {})
-- New buffer, open file
keymap('n', '<Leader>en', '<cmd>enew<cr>', {})
keymap('n', '<Leader>e.', ':e ', {})
keymap('n', '<Leader>el', ':e ~/', {})
-- Save buffer, all
keymap('n', '<Leader>w', '<cmd>w<cr>', {})
keymap('n', '<Leader>W', '<cmd>wa<cr>', {})
-- Close buffer, forcefully
keymap('n', '<Leader>d', '<cmd>bd<cr>', {})
keymap('n', '<Leader>D', '<cmd>bd!<cr>', {})
-- Quit nvim, forcefully
keymap('n', '<Leader>ql', '<cmd>qa<cr>', {})
keymap('n', '<Leader>qL', '<cmd>qa!<cr>', {})
-- Make C-d and C-u more consistent
keymap('n', '<C-d>', '12j', {})
keymap('n', '<C-u>', '12k', {})
