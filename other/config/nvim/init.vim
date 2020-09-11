" Calmer line number colors
highlight LineNr ctermfg=darkgrey
highlight CursorLineNr ctermfg=grey

" Calmer search result colors
highlight Search ctermfg=white ctermbg=darkgrey

" Calmer bracket match colors
highlight MatchParen ctermfg=lightgrey ctermbg=darkgrey

" Completely hide the window border
highlight VertSplit cterm=NONE
set fillchars+=vert:\ 

" Line numbers
set number
set relativenumber

" Lightline indicates insert mode, so this is not needed
set noshowmode

" View scrolls at 3 lines from the edges
set scrolloff=3

" Allows you to open another buffer without saving the current
set hidden

" Searching with lowercase characters will include uppercase results
set ignorecase

" Searching with uppercase characters will match explicitly
set smartcase

" View will not redraw during macros
set lazyredraw

" Tabs and Indents will be spaces
set expandtab

" <Tab> places 4 spaces
set tabstop=4

" Indent places 4 spaces
set shiftwidth=4

" When wrapping, do not break words
set linebreak

" Key for quick commands
let mapleader = ","

" Make a new window vertically, horizontally
map <C-f> <C-W>v
map <C-s> <C-W>s

" Close current window
map <C-q> <C-W>q

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open/close tab
nmap <silent> <C-n> :tabnew<cr>
nmap <silent> <C-b> :tabclose<cr>

" Move lines with alt + j/k
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Quick save
nmap <leader>w :w<cr>

" Copy to clipboard
vmap <silent> <leader>c :w !xclip -se c<cr><cr>

" Clear highlights
nmap <silent> <leader>/ :noh<cr>

" Open, close, and move between buffers.
nmap <leader>e :e 
nmap <silent> <leader>q :bdelete<cr>
nmap <silent> <leader>l :bnext<cr>
nmap <silent> <leader>j :bprevious<cr>

" fzf plugin commands
nmap <leader>f :Files 
nmap <leader>r :Rg 
nmap <leader>s :Lines 
nmap <leader>b :BLines 
nmap <leader>t :Tags 
nmap <leader>y :BTags 
nmap <leader>h :History
nmap <silent> <leader>g :Buffers<cr>
nmap <silent> <leader>k :Marks<cr>
nmap <silent> <leader>d :Windows<cr>
nmap <silent> <leader>m :Maps<cr>
nmap <silent> <leader>v :Commands<cr>
nmap <silent> <leader>p :HelpTags<cr>

" vim-plug
call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf.vim'
Plug 'mcchrish/nnn.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" Do not start newlines with a comment header
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" On focus, write the buffer with external changes (autoread is on)
autocmd FocusGained,BufEnter * checktime
