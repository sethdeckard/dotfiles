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
        "██     A R A S A K A   S Y S T E M S       ██",
        "██         NC DIVISION  //  NVIM           ██",
        "██                                         ██",
        "█████████████████████████████████████████████",
      }
      dashboard.section.header.val = header_lines
      dashboard.section.header.opts.hl = "ArasakaHeader"

      dashboard.section.buttons.val = {
        dashboard.button("f", "  [F] FIND FILE", "<cmd>Telescope find_files<cr>"),
        dashboard.button("r", "  [R] RECENT", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("g", "  [G] GREP", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("c", "  [C] CONFIG", "<cmd>e $MYVIMRC<cr>"),
        dashboard.button("q", "  [Q] QUIT", "<cmd>qa<cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "ArasakaButton"
        button.opts.hl_shortcut = "ArasakaShortcut"
      end

      dashboard.section.footer.val = "TERMINAL AUTHORIZED // SESSION ACTIVE"
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
