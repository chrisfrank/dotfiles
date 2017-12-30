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

" interpret jBuilder as ruby
au BufRead,BufNewFile *.jbuilder set filetype=ruby syntax=ruby
" interprest EJS as html
au BufNewFile,BufRead *.ejs set filetype=html
" highlight jsx syntax in .js files
let g:jsx_ext_required = 0

" Default indentation settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
"set colorcolumn=80

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

" disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
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

" --------------------------------------------------------
" Ruby test runner
" --------------------------------------------------------

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>rt :call RunNearestTest()<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_benchmark.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  if filereadable("Gemfile")
    exec ":!bundle exec rspec --color " . a:filename
  else
    exec ":!rspec --color " . a:filename
  end
endfunction
