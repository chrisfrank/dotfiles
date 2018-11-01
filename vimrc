call pathogen#infect()
filetype plugin indent on
syntax on
set nocompatible
set modelines=0
set encoding=utf-8
set scrolloff=3
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set number
set nowrap

" highlight jsx syntax in .js files
let g:jsx_ext_required = 0

" Default indentation settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set colorcolumn=80

" textmate style whitespace charts (show tabs and spaces)
set list listchars=tab:▸\ ,trail:· "show trailing whitespace

" Disables matchparen -- for performance reasons
let loaded_matchparen = 1
" Don't show character matches (maybe for performance reasons?)
set noshowmatch

" Friendlier search defaults
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <leader><space> :noh<cr>

" run bin/console from leader-c
nmap <leader>c :w \| !bin/console<cr>
" run bin/server from leader-s
nmap <leader>s :w \| !bin/server<cr>

" --------------------------------------------------------
" Splits!
" --------------------------------------------------------

" Make new splits/vsplits open below/right of current buffer
set splitbelow
set splitright

" ctrl-based navigation of splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" --------------------------------------------------------
" Editing .vimrc
" --------------------------------------------------------

" leader-v to open vimrc in a split
nmap <leader>ev :sp ~/.vimrc<cr>

" Automatically reload vimrc on save
augroup myvimrchooks
au!
autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" --------------------------------------------------------
" Plugin config
" --------------------------------------------------------

" Setup leader for silver searcher
nnoremap <leader>a :ag

" Run tests via janko-m/vim-test
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
