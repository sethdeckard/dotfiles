local opt = vim.opt

-- Theme
opt.background = "dark"
opt.termguicolors = true

-- Encoding
opt.encoding = "utf-8"

-- Buffers
opt.hidden = true
opt.directory = vim.fn.expand("~/.local/share/nvim/swapfiles//")

-- UI
opt.cmdheight = 2
opt.updatetime = 300
opt.shortmess:append("c")
opt.signcolumn = "yes"
opt.errorbells = false
opt.visualbell = true
opt.ruler = true
opt.number = true
opt.showcmd = true
opt.showmode = false
opt.autoread = true
opt.cursorline = true
opt.laststatus = 2
opt.scrolloff = 8
opt.sidescrolloff = 15
opt.sidescroll = 1
opt.guifont = "Hack Nerd Font:h13"

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- Line wrapping
opt.wrap = true
opt.linebreak = true
opt.colorcolumn = "80"

-- Backspace
opt.backspace = "indent,eol,start"

-- Wildignore
opt.wildignore:append("*/tmp/*,*.so,*.swp,*.zip")

-- Rails projections (same request spec mappings as .vimrc)
vim.g.rails_projections = {
  ["app/controllers/*_controller.rb"] = {
    test = {
      "spec/requests/{}_spec.rb",
      "spec/controllers/{}_controller_spec.rb",
      "test/controllers/{}_controller_test.rb",
    },
    alternate = {
      "spec/requests/{}_spec.rb",
      "spec/controllers/{}_controller_spec.rb",
      "test/controllers/{}_controller_test.rb",
    },
  },
  ["spec/requests/*_spec.rb"] = {
    command = "request",
    alternate = "app/controllers/{}_controller.rb",
    template = "require 'rails_helper'\n\nRSpec.describe '{}' do\nend",
  },
}

-- Leader key (before keymaps)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
