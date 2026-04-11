return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    },
    config = function()
      require("flash").setup({})

      -- Arasaka highlight groups
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "FlashMatch", { fg = "#35f2ff", bg = "#131923" })
      set_hl(0, "FlashCurrent", { fg = "#f7f779", bg = "#131923", bold = true })
      set_hl(0, "FlashLabel", { fg = "#0a0f14", bg = "#ff4d6d", bold = true })
      set_hl(0, "FlashBackdrop", { fg = "#55606b" })
      set_hl(0, "FlashCursor", { reverse = true })
    end,
  },
}
