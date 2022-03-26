let mapleader = ":"

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Tetralux/odin.vim'
Plug 'cespare/vim-toml'
Plug 'ap/vim-css-color'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

" basic settings
syntax enable
set background=dark
colorscheme nord
set smartindent
set number
set nobackup
set cursorline
set cursorcolumn
set ignorecase
set history=500
set expandtab
set wildmenu

set laststatus=2
let g:lightline = {'colorscheme': 'wombat'}

" Some keybindings
nmap <F2> <Plug>(coc-rename)
nmap <C-O> :NERDTreeToggle<CR>

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

fun! DeleteFileAndCloseBuffer()
  call delete(expand('%:p')) | q! | endif
endfun

nnoremap <Leader>rm<CR> :call DeleteFileAndCloseBuffer()<CR>

" Autoclose some tokens
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O

" Trim trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
