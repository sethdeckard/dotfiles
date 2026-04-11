return {
  { "tpope/vim-rails" },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    keys = { "gcc", "gbc", { "gc", mode = "v" }, { "gb", mode = "v" } },
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()

      -- Arasaka highlight groups
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "WhichKey", { fg = "#35f2ff", bold = true })
      set_hl(0, "WhichKeyGroup", { fg = "#ff9f1c" })
      set_hl(0, "WhichKeyDesc", { fg = "#93a1ad" })
      set_hl(0, "WhichKeySeparator", { fg = "#55606b" })
      set_hl(0, "WhichKeyFloat", { bg = "#0a0f14" })
      set_hl(0, "WhichKeyBorder", { fg = "#55606b", bg = "#0a0f14" })
      set_hl(0, "WhichKeyValue", { fg = "#f7f779" })
    end,
  },
  {
    "tpope/vim-sleuth",
  },
}
