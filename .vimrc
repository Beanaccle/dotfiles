syntax enable                      " シンタックスハイライトを有効にする

set number                         " 行番号を表示する
set list                           " 不可視文字を表示する
set listchars   =tab:>-,trail:-    " タブと行末のスペースを表示する
set laststatus  =2                 " ステータス行を表示する
set display     =lastline          " 長い行を省略せずに表示する
set showmode                       " モードを表示する

set expandtab                      " タブを半角スペースにする
set tabstop     =2                 " タブ幅
set shiftwidth  =2                 " オートインデント時のインデント幅
set autoindent                     " インデントをキープする
set backspace   =indent,eol,start  " バックスペースの挙動を変更する
set splitright                     " 新しいウィンドウを右に開く
set ttyfast                        " スクロールする時などのスピードが上がる?
set virtualedit =block             " 矩形選択で文字が無くても選択できる

set incsearch                      " インクリメンタル検索する
set ignorecase                     " 検索で大文字と小文字を区別しない
set smartcase                      " 大文字を含んで検索した場合は区別する
set hlsearch                       " 検索ワードをハイライトする
set wrapscan                       " 検索ワードをループする

set nobackup                       " バックアップファイルを作らない
set noswapfile                     " スワップファイルを作らない
set hidden                         " 編集中でも別ファイルを開ける

augroup vimrc
  autocmd FileType * set formatoptions-=ro
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 shiftwidth=4
augroup END

call plug#begin('~/.vim/plugged')
  Plug 'altercation/vim-colors-solarized'
  Plug 'scrooloose/nerdtree' " ファイルツリー
call plug#end()

if $TERM_PROGRAM != 'vscode'
  set background=dark
  colorscheme solarized
  let g:solarized_termcolors=256
  let NERDTreeShowHidden = 1
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * NERDTree | if argc() > 0 || exists('s:std_in') | wincmd p | endif
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
endif

