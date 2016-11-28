set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set number

call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
"Plug 'Valloric/YouCompleteMe'
call plug#end()

autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
