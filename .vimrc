" Vundle settings
set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" plugins
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'neilagabriel/vim-geeknote'
Plugin 'ledger/vim-ledger'
Plugin 'rizzatti/dash.vim'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
" color schemes
Plugin 'trusktr/seti.vim'
call vundle#end()
filetype plugin indent on 

" basic editor config
syntax on
colorscheme seti

set colorcolumn=80

set noerrorbells
set visualbell
set t_vb=

set expandtab
set shiftwidth=2
set tabstop=2

set ruler
set number
set showcmd

set backspace=2

set cul
hi CursorLine term=none cterm=none ctermbg=8

" avoid wearing out shift key
nore ; :
nore , ;

" easier move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if has("gui_running")
  set guioptions-=T
  autocmd vimenter * NERDTree
endif

" \n nerd tree tabs toggle
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '/Users/seth/.rbenv/shims/rubocop'

" spell check by file type
autocmd FileType Markdown setlocal spell
autocmd FileType HTML setlocal spell
autocmd FileType eruby setlocal spell

" force file type for unknowns
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jst.ejs set filetype=html

" remove trailing whitespace
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.vimrc :%s/\s\+$//e
