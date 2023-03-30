local keymap = vim.keymap.set

-- Space leader
vim.g.mapleader = ' '

-- Q functions as q
keymap('n', 'Q', 'q', {noremap=true})

-- Yank to clipboard
keymap('v', '<Leader>y', '"+y<cr>', {})

keymap({'n', 'v'}, '<C-u>', '6k', {})
keymap({'n', 'v'}, '<C-d>', '6j', {})

-- Navigate window
keymap('n', '<Leader>wv', '<C-w>v', {})
keymap('n', '<Leader>wq', '<C-w>q', {})
keymap('n', '<Leader>wl', '<C-w>l', {})
keymap('n', '<Leader>wh', '<C-w>h', {})
keymap('n', '<Leader>wk', '<C-w>k', {})
keymap('n', '<Leader>wj', '<C-w>j', {})

-- Bufferline
keymap('n', '<Leader>wn', '<cmd>BufferLineCycleNext<cr>', {})
keymap('n', '<Leader>wp', '<cmd>BufferLineCyclePrev<cr>', {})

-- Open/Save/Close buffer
keymap('n', '<Leader>e.', ':e ', {})
keymap('n', '<Leader>e,', ':e ~/', {})
keymap('n', '<Leader>ew', '<cmd>w<cr>', {})
keymap('n', '<Leader>ek', '<cmd>bd<cr>', {})
keymap('n', '<Leader>eK', '<cmd>bd!<cr>', {})

-- Telescope
keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', {})
keymap('n', '<Leader>fl', '<cmd>Telescope live_grep<cr>', {})
keymap('n', '<Leader>fo', '<cmd>Telescope oldfiles<cr>', {})
keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', {})

-- Quit nvim, forcefully
keymap('n', '<Leader>qq', '<cmd>qa<cr>', {})
keymap('n', '<Leader>qQ', '<cmd>qa!<cr>', {})
