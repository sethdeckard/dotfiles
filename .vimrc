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
Plugin 'vim-scripts/ShowTrailingWhitespace'
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
set gcr=a:blinkon0

set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set wrap
set linebreak

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

set ruler
set number
set showcmd
set noshowmode
set autoread

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

" mvim settings
if has("gui_running")
  set guioptions-=T
  autocmd vimenter * NERDTree
endif

set guifont=Hack:h12

" NERDTree settings
let NERDTreeShowHidden=1
" show current file in tree
map <Leader>r <esc>:NERDTreeFind<cr>
" \n NERDTree tabs toggle
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
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,ruby,python,vim autocmd BufWritePre <buffer>
  \ :call <SID>StripTrailingWhitespaces()
