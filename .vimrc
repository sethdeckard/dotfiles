set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'neilagabriel/vim-geeknote'
Plugin 'trusktr/seti.vim'
Plugin 'ledger/vim-ledger'
Plugin 'rizzatti/dash.vim'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            
filetype plugin indent on 

syntax on
filetype plugin indent on

set colorcolumn=80

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
endif

au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jst.ejs set filetype=html

map <Leader>n <plug>NERDTreeTabsToggle<CR>

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_warnings = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '/Users/seth/.rbenv/shims/rubocop'

" spell check by file type
autocmd FileType Markdown setlocal spell
autocmd FileType HTML setlocal spell
autocmd FileType eruby setlocal spell
