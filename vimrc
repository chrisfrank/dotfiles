filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
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
set backspace=indent,eol,start
set laststatus=2
set number
set nowrap
set noswapfile

" highlight jsx syntax in .js files
let g:jsx_ext_required = 0
let g:markdown_fenced_languages = ['go', 'javascript', 'typescript']

" Go syntax highlighting
let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
"let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Default indentation settings (for JS/TS)
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set colorcolumn=80

autocmd Filetype go setlocal noexpandtab

" Theme
set background=light
colorscheme solarized
set termguicolors
"highlight LineNr ctermbg=NONE guibg=NONE

" textmate style whitespace charts (show tabs and spaces)
set list listchars=tab:▸\ ,trail:· "show trailing whitespace
autocmd Filetype go setlocal nolist

" Friendlier search defaults
set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <leader><space> :noh<cr>

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
