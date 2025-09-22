source ~/.vimrc

" override or disable anything incompatible with neovim

" Copilot.lua configuration (doesn't work?)
lua << EOF
require('copilot').setup({})
EOF
