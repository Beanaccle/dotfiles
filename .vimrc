"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein')

  " Add or remove your plugins here:
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-endwise')
  call dein#add('w0rp/ale')
  "
  call dein#add('pangloss/vim-javascript')
  call dein#add('slim-template/vim-slim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

set backspace=indent,eol,start
set encoding=utf-8
set fileformats=unix,dos,mac
set nobackup
set noswapfile
set hidden
set number
set ruler
set list
set listchars=tab:>-,trail:-
set showmatch
set nowrap
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set scrolloff=5
set smartcase
set incsearch
set hlsearch

" convert file encode
function SetUU()
  set ff=unix
  set fenc=utf8
endfunction
command -nargs=0 SetUU call SetUU()

" filetype setting
if has("autocmd")
  autocmd FileType * set formatoptions-=ro " 改行時にコメントしない

  autocmd FileType php setlocal ts=2 sts=2 sw=2
  autocmd FileType c setlocal ts=4 sw=4 noexpandtab
  autocmd FileType java setlocal ts=4 sts=4 sw=4
  autocmd FileType html,xhtml,css,scss,javascript,coffee,sh,sql,yaml setlocal ts=2 sts=2 sw=2

  " for Rails
  autocmd BufNewFile,BufRead app/*/*.erb setlocal ft=eruby fenc=utf-8
  autocmd BufNewFile,BufRead app/**/*.rb setlocal ft=ruby fenc=utf-8
  autocmd BufNewFile,BufRead app/**/*.yml setlocal ft=ruby fenc=utf-8
  autocmd BufNewFile,BufRead *.slim set ft=slim fenc=utf-8
  autocmd BufNewFile,BufRead *.cap setlocal ft=ruby fenc=utf-8
  autocmd FileType ruby,haml,slim,eruby,sass,mason setlocal ts=2 sts=2 sw=2 et

  " for markdown
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  autocmd FileType markdown hi! def link markdownItalic LineNr

  " for Node.js
  autocmd BufNewFile,BufRead *.ejs set filetype=javascript

  " for Vue.js
  autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

  " for React.js
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript

  " for Go
  autocmd BufNewFile,BufRead *.go setlocal ts=4 sts=4 sw=4
endif

" colorscheme setting
colorscheme solarized
set background=dark
let g:solarized_termcolors=256

" status line setting
let g:lightline = {
  \ 'colorscheme' : 'solarized' ,
  \ 'active': {
    \ 'left': [ ['mode', 'paste'], ['fugitive', 'filename'] ]
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'fugitive': 'LightLineFugitive'
  \ }
  \ }
function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" ALE
let g:ale_sign_column_always = 1
let g:ale_linters = { 'html': [] }

" The-NERD-tree
let NERDTreeShowHidden = 1
nnoremap :tree :NERDTreeToggle
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 自動的に quickfix-window を開く
autocmd QuickFixCmdPost *grep* cwindow

" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
