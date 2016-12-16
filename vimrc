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
"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized
"
" interpret jBuilder as ruby
au BufRead,BufNewFile *.jbuilder set filetype=ruby syntax=ruby
" interprest EJS as html
au BufNewFile,BufRead *.ejs set filetype=html

" Default indentation settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
"set colorcolumn=80

" textmate style whitespace charts (show tabs and spaces)
set list listchars=tab:▸\ ,trail:· "show trailing whitespace

" Folding settings
"set foldmethod=syntax
"set foldnestmax=5
"set foldlevel=50
"set foldcolumn=0

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

" redraw screen quickly
"nmap <leader>r :redraw!<cr>

" rack console
nmap <leader>r :w \| !foreman run racksh<cr>
" start server
nmap <leader>f :w \| !foreman start<cr>

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

" Setup leader for Ack
nnoremap <leader>a :Ack

" --------------------------------------------------------
" Ruby test runner
" --------------------------------------------------------

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<exhibits\>') != -1 || match(current_file, '\<services\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>et :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>rt :call RunNearestTest()<cr>
map <leader>. :call RunTests('')<cr>
"map <leader>c :w\|:!script/acceptance<cr>
map <leader>w :w\|:!script/acceptance --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
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
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/acceptance " . a:filename
    else
        if filereadable("script/test.rb")
            exec ":!ruby script/test.rb " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

function! WordProcessorMode()
    setlocal formatoptions=t1
    setlocal textwidth=80
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
    execute 'topleft' ((&columns - &textwidth) / 2 - 1) . 'vsplit _paddding_' | wincmd p
endfunction

let g:centerinscreen_active = 0
function! ToggleCenterInScreen(desired_width)
  if g:centerinscreen_active == 0
    let l:window_width = winwidth(winnr())
    let l:sidepanel_width = (l:window_width - a:desired_width) / 2
    exec("silent leftabove " . l:sidepanel_width . "vsplit __padding__")
    wincmd l
    exec("silent rightbelow " . l:sidepanel_width . "vsplit __padding__")
    wincmd h
    let g:centerinscreen_active = 1
  else
    wincmd h
    close
    wincmd l
    close
    let g:centerinscreen_active = 0
  endif
endfunction

com! WP call WordProcessorMode()
com! C call ToggleCenterInScreen(100)

