return {
  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Arasaka highlight groups
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "ArasakaHeader", { fg = "#f7f779", bold = true })
      set_hl(0, "ArasakaButton", { fg = "#35f2ff" })
      set_hl(0, "ArasakaShortcut", { fg = "#ff4d6d", bold = true })
      set_hl(0, "ArasakaFooter", { fg = "#55606b", italic = true })

      local header_lines = {
        "█████████████████████████████████████████████",
        "██                                         ██",
        "██             T E R M I N A L             ██",
        "██              S Y S T E M S              ██",
        "██                                         ██",
        "█████████████████████████████████████████████",
      }
      dashboard.section.header.val = header_lines
      dashboard.section.header.opts.hl = "ArasakaHeader"

      dashboard.section.buttons.val = {
        dashboard.button("f", "  [F] FIND FILE", "<cmd>lua require('telescope.builtin').find_files()<cr>"),
        dashboard.button("r", "  [R] RECENT", "<cmd>lua require('telescope.builtin').oldfiles()<cr>"),
        dashboard.button("g", "  [G] GREP", "<cmd>lua require('telescope.builtin').live_grep()<cr>"),
        dashboard.button("c", "  [C] CONFIG", "<cmd>e $MYVIMRC<cr>"),
        dashboard.button("q", "  [Q] QUIT", "<cmd>qa<cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "ArasakaButton"
        button.opts.hl_shortcut = "ArasakaShortcut"
      end

      local v = vim.version()
      local stats = require("lazy").stats()
      dashboard.section.footer.val = string.format(
        "NVIM v%d.%d.%d // %d PLUGINS LOADED", v.major, v.minor, v.patch, stats.loaded
      )
      dashboard.section.footer.opts.hl = "ArasakaFooter"

      dashboard.config.layout = {
        { type = "padding", val = 4 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.config)
    end,
  },
}
