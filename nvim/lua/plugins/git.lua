return {
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "+" },
          change       = { text = "~" },
          delete       = { text = "_" },
          topdelete    = { text = "-" },
          changedelete = { text = "~" },
        },
      })
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "GitSignsAdd", { fg = "#35f2ff", bg = "#0a0f14" })
      set_hl(0, "GitSignsChange", { fg = "#f7f779", bg = "#0a0f14" })
      set_hl(0, "GitSignsDelete", { fg = "#ff4d6d", bg = "#0a0f14" })
    end,
  },
}
