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
" improve python syntax highlighting
let g:python_highlight_all = 1
let g:markdown_fenced_languages = ['python']

" Default indentation settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set colorcolumn=80
set termguicolors
"set background=dark
"colorscheme gruvbox8
set background=light
colorscheme solarized8

" textmate style whitespace charts (show tabs and spaces)
set list listchars=tab:▸\ ,trail:· "show trailing whitespace
autocmd Filetype go setlocal nolist

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

" --------------------------------------------------------
" Plugin config
" --------------------------------------------------------

" Setup leader for silver searcher
nnoremap <leader>a :ag

" Run tests via janko-m/vim-test
nmap t<C-n> :TestNearest<CR>
nmap t<C-f> :TestFile<CR>
nmap t<C-s> :TestSuite<CR>
nmap t<C-l> :TestLast<CR>
nmap t<C-g> :TestVisit<CR>
