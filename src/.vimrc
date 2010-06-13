"                                    /$$
"                                   | $$
"       /$$$$$$   /$$$$$$   /$$$$$$ | $$  /$$$$$$
"      /$$__  $$ |____  $$ /$$__  $$| $$ /$$__  $$
"     | $$$$$$$$  /$$$$$$$| $$  \ $$| $$| $$$$$$$$
"     | $$_____/ /$$__  $$| $$  | $$| $$| $$_____/
"  /$$|  $$$$$$$|  $$$$$$$|  $$$$$$$| $$|  $$$$$$$
" |__/ \_______/ \_______/ \____  $$|__/ \_______/
"                          /$$  \ $$
"                         |  $$$$$$/
"                          \______/
"
" Nate Eagle's .vimrc file.
" =========================
" If my .vimrc file is going to suck, it might as well be because I 
" assembled it.
"
" Maintainer:	Nate Eagle <nate@nateeagle.com>
" Last Change:	2010 Feb 06
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" set tabstop
set tabstop=4

" Sets how many lines of history VIM has to remember
set history=300

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ruler " show the cursor position all the time
set number " show line numbers

" Set backspace configuration
set backspace=eol,start,indent

" Search Configuration
set ignorecase " Ignore case when searching
set hlsearch " Hilight search results
set incsearch " do incremental searching

set showmatch " Show matching brackets when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " Enable syntax highlighting

" Set font according to system

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and Backups 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab, and indent related 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
autocmd BufRead,BufNewFile Makefile set noexpandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Run JSLint on save
" autocmd BufWritePost *.js JSLint
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CHANGE_CURR_DIR()
    let _dir = expand("%:p:h")
    exec "cd " . _dir
    unlet _dir
endfunction
autocmd BufEnter * call CHANGE_CURR_DIR()

map <C-J> <C-W>j
map <C-K> <C-W>k
map <c-h> <c-w>h
map <c-l> <c-w>l

