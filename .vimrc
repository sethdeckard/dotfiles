set nocompatible
filetype off

" Vundle settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" plugins
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'rizzatti/dash.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'fatih/vim-go'
" color schemes
Plugin 'trusktr/seti.vim'
Plugin 'altercation/vim-colors-solarized'
" icons
Plugin 'ryanoasis/vim-devicons'
call vundle#end()
filetype plugin indent on

" basic editor config
syntax enable

" theme
set background=dark
let g:solarized_visibility = 'high'
let g:solarized_contrast = 'high'
let g:solarized_termtrans = 1
colorscheme solarized

set encoding=utf8 " vim-devicons glyphs

set hidden
set noswapfile

set noerrorbells
set visualbell
set t_vb=

set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set wrap
set linebreak
set colorcolumn=80

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
set gcr=a:blinkon0

" show airline on start
set laststatus=2

" avoid wearing out shift key
nore ; :
nore , ;

" easier move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap Y y$

" mvim settings
if has("gui_running")
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

set guifont=Knack\ Nerd\ Font:h12

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" ctrlp settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'r'

" NERDTree settings
let NERDTreeShowHidden = 1
let NERDTreeMouseMode = 3
" show current file in tree
map <Leader>r <esc>:NERDTreeFind<cr>
" \n NERDTree toggle
map <Leader>n :NERDTreeToggle<CR>
" close NERDTree if only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
  \ && b:NERDTree.isTabTree()) | q | endif

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec = '/Users/seth/.rbenv/shims/rubocop'
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = 'quickfix'

" vim-devicons settings
let g:airline_powerline_fonts = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" spell check by file type
autocmd FileType Markdown setlocal spell
autocmd FileType HTML setlocal spell
autocmd FileType eruby setlocal spell

" force file type for unknowns
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jst.ejs set filetype=html
au BufNewFile,BufRead *.es6 set filetype=javascript

" remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,ruby,eruby,markdown,python,sh,vim autocmd BufWritePre <buffer>
  \ :call <SID>StripTrailingWhitespaces()
