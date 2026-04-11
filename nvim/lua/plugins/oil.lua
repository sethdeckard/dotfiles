return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", function() require("oil").open() end, desc = "Open parent directory" },
    },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        view_options = {
          show_hidden = true,
        },
      })

      -- Arasaka highlight groups
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "OilDir", { fg = "#4da6ff", bold = true })
      set_hl(0, "OilDirIcon", { fg = "#4da6ff" })
      set_hl(0, "OilLink", { fg = "#35f2ff" })
      set_hl(0, "OilLinkTarget", { fg = "#55606b", italic = true })
      set_hl(0, "OilCreate", { fg = "#35f2ff" })
      set_hl(0, "OilDelete", { fg = "#ff4d6d" })
      set_hl(0, "OilMove", { fg = "#ff9f1c" })
      set_hl(0, "OilCopy", { fg = "#f7f779" })
      set_hl(0, "OilChange", { fg = "#f7f779" })
    end,
  },
}
