set nocompatible

" install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')
" vim help for vim-plug
Plug 'junegunn/vim-plug'
" git / scm
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" navigation
Plug 'rizzatti/dash.vim'
" visual status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ShowTrailingWhitespace'
" frameworks
Plug 'tpope/vim-rails'
" color schemes
Plug 'lifepillar/vim-solarized8'
" icons
Plug 'ryanoasis/vim-devicons'
call plug#end()

" theme
set background=dark
let g:solarized_visibility = 'high'
colorscheme solarized8 " solarized8_high for high contrast variant
set termguicolors

set encoding=utf8 " vim-devicons glyphs

set hidden
set directory=~/.vim/swapfiles//

" more space for displaying messages.
set cmdheight=2

set updatetime=300
set shortmess+=c

" Always show the signcolumn
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

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
autocmd Filetype swift setlocal ts=4 sw=4 sts=4 expandtab colorcolumn=120

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

set guifont=IosevkaTerm\ Nerd\ Font:h14

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'arasaka'

" arasaka editor chrome
hi Normal guifg=#93a1ad guibg=#0a0f14 ctermfg=252 ctermbg=233
hi NormalNC guifg=#93a1ad guibg=#0a0f14 ctermfg=252 ctermbg=233
hi SignColumn guibg=#0a0f14 ctermbg=233
hi LineNr guifg=#55606b guibg=#0a0f14 ctermfg=240 ctermbg=233
hi CursorLine guibg=#131923 ctermbg=234
hi CursorLineNr guifg=#f7f779 guibg=#131923 gui=bold ctermfg=227 ctermbg=234 cterm=bold
hi ColorColumn guibg=#131923 ctermbg=234
hi VertSplit guifg=#55606b guibg=#0a0f14 ctermfg=240 ctermbg=233
hi StatusLine guifg=#0a0f14 guibg=#f7f779 gui=bold ctermfg=233 ctermbg=227 cterm=bold
hi StatusLineNC guifg=#55606b guibg=#131923 ctermfg=240 ctermbg=234
hi Visual guibg=#1c2433 ctermbg=235
hi Search guifg=#0a0f14 guibg=#f7f779 gui=bold ctermfg=233 ctermbg=227 cterm=bold
hi IncSearch guifg=#0a0f14 guibg=#ff4d6d gui=bold ctermfg=233 ctermbg=204 cterm=bold
hi Pmenu guifg=#93a1ad guibg=#131923 ctermfg=252 ctermbg=234
hi PmenuSel guifg=#0a0f14 guibg=#f7f779 gui=bold ctermfg=233 ctermbg=227 cterm=bold
hi MatchParen guifg=#f7f779 gui=bold ctermfg=227 cterm=bold
hi Comment guifg=#55606b gui=italic ctermfg=240 cterm=italic
hi Constant guifg=#f7f779 ctermfg=227
hi String guifg=#f7f779 ctermfg=227
hi Character guifg=#f7f779 ctermfg=227
hi Number guifg=#ff9f1c ctermfg=214
hi Boolean guifg=#ff9f1c gui=bold ctermfg=214 cterm=bold
hi Identifier guifg=#93a1ad ctermfg=252
hi Function guifg=#35f2ff gui=bold ctermfg=51 cterm=bold
hi Statement guifg=#ff4d6d gui=bold ctermfg=204 cterm=bold
hi Conditional guifg=#ff4d6d gui=bold ctermfg=204 cterm=bold
hi Repeat guifg=#ff4d6d gui=bold ctermfg=204 cterm=bold
hi Keyword guifg=#ff4d6d gui=bold ctermfg=204 cterm=bold
hi Operator guifg=#ff4d6d ctermfg=204
hi Type guifg=#35f2ff gui=bold ctermfg=51 cterm=bold
hi Special guifg=#ff9f1c ctermfg=214
hi PreProc guifg=#ff9f1c gui=bold ctermfg=214 cterm=bold
hi Todo guifg=#0a0f14 guibg=#f7f779 gui=bold ctermfg=233 ctermbg=227 cterm=bold

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
au BufNewFile,BufRead Brewfile,Dangerfile,*.danger,Podfile,*.podspec set filetype=ruby

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
