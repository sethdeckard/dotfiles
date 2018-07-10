" HACK: https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

set nocompatible
filetype off

" Vundle settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" plugins
Plugin 'w0rp/ale'
Plugin 'rizzatti/dash.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
" languages and frameworks
Plugin 'fatih/vim-go'
Plugin 'keith/swift.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-rails'
" color schemes
Plugin 'trusktr/seti.vim'
Plugin 'altercation/vim-colors-solarized'
" icons
Plugin 'ryanoasis/vim-devicons'
" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
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
set directory=~/.vim/swapfiles//

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

set guifont=Knack\ Nerd\ Font:h13

" airline settings
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" ale settings
let g:ale_lint_on_text_changed = 'normal'

" ctrlp settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'r'

" ycm settings
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" supertab settings
let g:SuperTabDefaultCompletionType = '<C-n>'

" utilsnips settings
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = 'quickfix'

" vim-jsx
let g:jsx_ext_required = 0

" vim-devicons settings
let g:airline_powerline_fonts = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" spell check by file type
au FileType Markdown setlocal spell
au FileType HTML setlocal spell
au FileType eruby setlocal spell

" force file type for unknowns
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jst.ejs set filetype=html
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead Brewfile,Podfile,*.podspec set filetype=ruby

" remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

au FileType c,cpp,css,dockerfile,ruby,eruby,markdown,python,sh,vim,javascript.jsx,
  \javascript,objc,swift,zsh au BufWritePre <buffer>
  \ :call <SID>StripTrailingWhitespaces()

" rails projections
" adds request spec mapping for API devel when mapping is 1:1
let g:rails_projections = {
      \  "app/controllers/*_controller.rb": {
      \      "test": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \      "alternate": [
      \        "spec/requests/{}_spec.rb",
      \        "spec/controllers/{}_controller_spec.rb",
      \        "test/controllers/{}_controller_test.rb"
      \      ],
      \   },
      \   "spec/requests/*_spec.rb": {
      \      "command": "request",
      \      "alternate": "app/controllers/{}_controller.rb",
      \      "template": "require 'rails_helper'\n\n" .
      \        "RSpec.describe '{}' do\nend",
      \   },
      \ }
