call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

syntax enable
set background=dark
colorscheme nord

set number
