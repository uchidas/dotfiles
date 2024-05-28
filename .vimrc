"
" encode
"
set encoding=utf8
set fileencoding=utf-8

"
" disabele backup
"
set nowritebackup
set nobackup
set noswapfile

"
" editor
" 
syntax enable
set number

" indent
set autoindent
set smartindent
set listset listchars=tab:»-
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

"
" insert
" 
set backspace=indent,eol,start

"
" clipboard
" 
if has('unnamedplus')
    set clipboard+=unnamedplus,unnamed
else
    set clipboard+=unnamed
endif

"
" mouse
"
set mouse=a
set ttymouse=xterm2

"
" search
"
nnoremap / /\v

" 
" load ~/.vimrc.local
"
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
