call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'

call plug#end()

syntax enable
set background=dark
colorscheme nord

set number
set nobackup
set cursorline
set cursorcolumn
set ignorecase
set history=500

set laststatus=2
let g:lightline = {'colorscheme': 'wombat'}
