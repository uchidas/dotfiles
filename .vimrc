" release autogroup in MyAutoCmd
augroup MyAutoCmd
   autocmd!
augroup END

" NeoBundle Configure
"
"
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
" color scheme
NeoBundle 'altercation/vim-colors-solarized'

" contents assist
" load on insert mode
NeoBundleLazy 'Shougo/neocomplcache.vim', {
    \ 'autoload' :  {'insert': 1}}
let s:hooks = neobundle#get_hooks('neocomplcache.vim')

function! s:hooks.on_source(bundle)
    let g:neocomplcache_enable_at_startup = 1
endfunction

NeoBundleLazy 'Shougo/unite.vim', {
    \ 'autoload' : {
    \   'commands':['Unite', 'UniteWithBufferDir']
    \ }}

NeoBundleLazy 'h1mesuke/unite-outline', {
    \ 'autoload' : {
    \   'unite_sources' : ['outline'],
    \ }}
let s:hooks = neobundle#get_hooks('unite.vim')

function! s:hooks.on_source(bundle)
    " start unite in insert mode
    let g:unite_enable_start_insert = 1
endfunction

NeoBundleLazy 'Shougo/vimfiler', {
      \ 'depends': ['Shougo/unite.vim'],
      \ 'autoload': {
      \   'commands': ['VimFilerTab', 'VimFiler', 'VimFilerExplorer'],
      \   'mappings': ['<Plug>(vimfiler_switch)'],
      \   'explorer': 1,
      \ }}
let s:hooks = neobundle#get_hooks('vimfiler')

function! s:hooks.on_source(bundle)
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_enable_auto_cd = 1

    " .から始まるファイルおよび.pycで終わるファイルを不可視パターンに
    let g:vimfiler_ignore_pattern = '\%(^\..*\|\.pyc$\)'
endfunction

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck
call neobundle#end()

"
" todo .vim配下に各まとまりごとに記述する
" user Configure
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

let g:neocomplcache_enable_at_startup=1

set number
set autoindent

" Swapファイル？Backupファイル？前時代的すぎ
" " なので全て無効化する
set nowritebackup
set nobackup
set noswapfile

" エンコード
set encoding=utf8
" ファイルエンコード
set fileencoding=utf-8

" 不可視文字を表示
"set list
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:¶

" insert時にbackspaceを有効に
set backspace=indent,eol,start

if has('unnamedplus')
    set clipboard+=unnamedplus,unnamed
else
    set clipboard+=unnamed
endif

" マウス操作を有効に
set mouse=a
set ttymouse=xterm2

" パターン検索を常にvery magicで検索
nnoremap / /\v

"-------------------------------------------------
" Indent インデント設定
"-------------------------------------------------

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" <Tab> が対応する空白の数。
set tabstop=4

" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab>
" が対応する空白の数。
set softtabstop=4

" インデントの各段階に使われる空白の数
set shiftwidth=4

" Insertモードで <Tab>
" を挿入するとき、代わりに適切な数の空白を使う。（有効:expandtab/無効:noexpandtab）
set noexpandtab

" Insertモードで <Tab> を挿入するのに、適切な数の空白を使う
set expandtab

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" load ~/.vimrc.local
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

"-------------------------------------------------
" ファイルの関連付け
"-------------------------------------------------
autocmd MyAutoCmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
