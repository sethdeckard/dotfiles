set nocompatible
filetype off

" Vundle settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" completion
Plugin 'ervandew/supertab'
Plugin 'rdnetto/YCM-Generator'
Plugin 'Valloric/YouCompleteMe'
" git / scm
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" linting
Plugin 'w0rp/ale'
" navigation
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'ludovicchabant/vim-gutentags'
" visual status
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/ShowTrailingWhitespace'
" languages and frameworks
" color_coded does not work when vim is built with LuaJIT support:
Plugin 'jeaye/color_coded'
Plugin 'udalov/kotlin-vim'
Plugin 'fatih/vim-go'
Plugin 'keith/swift.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'rhysd/vim-crystal'
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

" default indentation
set shiftwidth=2 " sw
set tabstop=2 " ts
set softtabstop=2 " sts

" line length stuff
set wrap
set linebreak
set colorcolumn=80

" language-specific
autocmd Filetype cpp setlocal ts=4 sw=4 sts=4 expandtab colorcolumn=120
autocmd Filetype groovy setlocal ts=4 sw=4 sts=4 expandtab colorcolumn=100
autocmd Filetype kotlin setlocal ts=4 sw=4 sts=4 expandtab colorcolumn=100
autocmd Filetype java setlocal ts=4 sw=4 sts=4 expandtab colorcolumn=120
autocmd Filetype objc setlocal ts=4 sw=4 sts=4 expandtab colorcolumn=120
autocmd Filetype objcpp setlocal ts=4 sw=4 sts=4 expandtab colorcolumn=120

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

" quick list of registers
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

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
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
"  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|xib|xcconfig)$',
"\}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_user_command = ['ag %s --path-to-ignore ~/.ignore -l --nocolor --hidden -g ""']

" ycm settings
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" TODO: java/kotlin completion generates annoying elcipse artifacts (.project, etc)
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'java': 1,
      \ 'kotlin': 1,
      \}
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

au FileType bash,c,cpp,css,diff,dockerfile,eruby,groovy,java,javascript,
  \javascript.jsx,kotlin,markdown,objc,objcpp,php,python,ruby,sh,scss,sql,
  \swift,vim,zsh,yaml au BufWritePre <buffer>
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
