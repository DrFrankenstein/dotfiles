set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set number
set textwidth=80

syntax enable
filetype plugin indent on

if &shell =~# 'fish$'
  set shell=bash
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-syntastic/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
"Plug 'Valloric/YouCompleteMe'
Plug 'dag/vim-fish'
call plug#end()

autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

autocmd FileType fish compiler fish
autocmd FileType fish setlocal foldmethod=expr

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusLineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
