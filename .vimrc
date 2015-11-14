set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'neilagabriel/vim-geeknote'
Plugin 'trusktr/seti.vim'
Plugin 'ledger/vim-ledger'
Plugin 'rizzatti/dash.vim'
call vundle#end()            
filetype plugin indent on 

syntax on
filetype plugin indent on

set noerrorbells
set visualbell
set t_vb=

set shiftwidth=4
set tabstop=4
set expandtab

set ruler
set number
set showcmd

set backspace=2

set cul
hi CursorLine term=none cterm=none ctermbg=8

nore ; :
nore , ;

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if has("gui_running")
   colorscheme seti
   set guioptions-=T
   autocmd vimenter * NERDTree
   set transparency=10
endif

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
highlight Pmenu ctermbg=238 gui=bold ctermfg=3

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jst.ejs set filetype=html
