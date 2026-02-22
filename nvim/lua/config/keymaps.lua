local map = vim.keymap.set

-- Avoid wearing out shift key
map("n", ";", ":", { noremap = true })
map("n", ",", ";", { noremap = true })
map("v", ";", ":", { noremap = true })
map("v", ",", ";", { noremap = true })

-- Easier move between splits
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-j>", "<C-w>j", { noremap = true })
map("n", "<C-k>", "<C-w>k", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })

-- Make Y behave like D and C
map("n", "Y", "y$", { noremap = true })

-- Quick list of registers
map("n", '""', ':registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>', { noremap = true, silent = true })
