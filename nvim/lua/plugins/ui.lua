return {
  {
    "ishan9299/nvim-solarized-lua",
    lazy = false,
    priority = 1000,
    config = function()
      local arasaka = {
        bg = "#0a0f14",
        bg_alt = "#131923",
        muted = "#55606b",
        fg = "#93a1ad",
        yellow = "#f7f779",
        cyan = "#35f2ff",
        red = "#ff4d6d",
        orange = "#ff9f1c",
      }

      vim.cmd.colorscheme("solarized")

      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "Normal", { fg = arasaka.fg, bg = arasaka.bg })
      set_hl(0, "NormalNC", { fg = arasaka.fg, bg = arasaka.bg })
      set_hl(0, "SignColumn", { bg = arasaka.bg })
      set_hl(0, "LineNr", { fg = arasaka.muted, bg = arasaka.bg })
      set_hl(0, "CursorLine", { bg = arasaka.bg_alt })
      set_hl(0, "CursorLineNr", { fg = arasaka.yellow, bg = arasaka.bg_alt, bold = true })
      set_hl(0, "ColorColumn", { bg = arasaka.bg_alt })
      set_hl(0, "CursorColumn", { bg = arasaka.bg_alt })
      set_hl(0, "WinSeparator", { fg = arasaka.muted, bg = arasaka.bg })
      set_hl(0, "VertSplit", { fg = arasaka.muted, bg = arasaka.bg })
      set_hl(0, "StatusLine", { fg = arasaka.bg, bg = arasaka.yellow, bold = true })
      set_hl(0, "StatusLineNC", { fg = arasaka.muted, bg = arasaka.bg_alt })
      set_hl(0, "Visual", { bg = "#1c2433" })
      set_hl(0, "Search", { fg = arasaka.bg, bg = arasaka.yellow, bold = true })
      set_hl(0, "IncSearch", { fg = arasaka.bg, bg = arasaka.red, bold = true })
      set_hl(0, "Pmenu", { fg = arasaka.fg, bg = arasaka.bg_alt })
      set_hl(0, "PmenuSel", { fg = arasaka.bg, bg = arasaka.yellow, bold = true })
      set_hl(0, "MatchParen", { fg = arasaka.yellow, bold = true })
      set_hl(0, "Comment", { fg = arasaka.muted, italic = true })
      set_hl(0, "Constant", { fg = arasaka.yellow })
      set_hl(0, "String", { fg = arasaka.yellow })
      set_hl(0, "Character", { fg = arasaka.yellow })
      set_hl(0, "Number", { fg = arasaka.orange })
      set_hl(0, "Boolean", { fg = arasaka.orange, bold = true })
      set_hl(0, "Identifier", { fg = arasaka.fg })
      set_hl(0, "Function", { fg = arasaka.cyan, bold = true })
      set_hl(0, "Statement", { fg = arasaka.red, bold = true })
      set_hl(0, "Conditional", { fg = arasaka.red, bold = true })
      set_hl(0, "Repeat", { fg = arasaka.red, bold = true })
      set_hl(0, "Keyword", { fg = arasaka.red, bold = true })
      set_hl(0, "Operator", { fg = arasaka.red })
      set_hl(0, "Type", { fg = arasaka.cyan, bold = true })
      set_hl(0, "Special", { fg = arasaka.orange })
      set_hl(0, "PreProc", { fg = arasaka.orange, bold = true })
      set_hl(0, "Todo", { fg = arasaka.bg, bg = arasaka.yellow, bold = true })
      set_hl(0, "DiagnosticError", { fg = arasaka.red })
      set_hl(0, "DiagnosticWarn", { fg = arasaka.orange })
      set_hl(0, "DiagnosticInfo", { fg = arasaka.cyan })
      set_hl(0, "DiagnosticHint", { fg = arasaka.cyan })
      set_hl(0, "DiagnosticSignError", { fg = arasaka.red, bg = arasaka.bg })
      set_hl(0, "DiagnosticSignWarn", { fg = arasaka.orange, bg = arasaka.bg })
      set_hl(0, "DiagnosticSignInfo", { fg = arasaka.cyan, bg = arasaka.bg })
      set_hl(0, "DiagnosticSignHint", { fg = arasaka.cyan, bg = arasaka.bg })

      -- Treesitter / semantic tokens
      set_hl(0, "@comment", { link = "Comment" })
      set_hl(0, "@comment.todo", { link = "Todo" })
      set_hl(0, "@constant", { link = "Constant" })
      set_hl(0, "@constant.builtin", { fg = arasaka.orange, bold = true })
      set_hl(0, "@string", { link = "String" })
      set_hl(0, "@string.escape", { fg = arasaka.orange, bold = true })
      set_hl(0, "@character", { link = "Character" })
      set_hl(0, "@number", { link = "Number" })
      set_hl(0, "@boolean", { link = "Boolean" })
      set_hl(0, "@function", { link = "Function" })
      set_hl(0, "@function.builtin", { fg = arasaka.cyan, bold = true })
      set_hl(0, "@method", { fg = arasaka.cyan })
      set_hl(0, "@constructor", { fg = arasaka.cyan, bold = true })
      set_hl(0, "@keyword", { link = "Keyword" })
      set_hl(0, "@keyword.function", { fg = arasaka.red, bold = true })
      set_hl(0, "@keyword.return", { fg = arasaka.red, bold = true })
      set_hl(0, "@conditional", { link = "Conditional" })
      set_hl(0, "@repeat", { link = "Repeat" })
      set_hl(0, "@operator", { link = "Operator" })
      set_hl(0, "@type", { link = "Type" })
      set_hl(0, "@type.builtin", { fg = arasaka.cyan, bold = true })
      set_hl(0, "@property", { fg = arasaka.fg })
      set_hl(0, "@field", { fg = arasaka.fg })
      set_hl(0, "@variable", { fg = arasaka.fg })
      set_hl(0, "@variable.builtin", { fg = arasaka.orange })
      set_hl(0, "@parameter", { fg = arasaka.fg })
      set_hl(0, "@punctuation.delimiter", { fg = arasaka.muted })
      set_hl(0, "@punctuation.bracket", { fg = arasaka.muted })

      -- noice.nvim
      set_hl(0, "NoiceCmdline", { fg = arasaka.fg, bg = arasaka.bg_alt })
      set_hl(0, "NoiceCmdlineIcon", { fg = arasaka.yellow, bg = arasaka.bg_alt })
      set_hl(0, "NoiceCmdlinePopup", { fg = arasaka.fg, bg = arasaka.bg_alt })
      set_hl(0, "NoiceCmdlinePopupBorder", { fg = arasaka.muted, bg = arasaka.bg_alt })
      set_hl(0, "NoiceCmdlinePopupTitle", { fg = arasaka.yellow, bold = true })
      set_hl(0, "NoiceConfirm", { fg = arasaka.fg, bg = arasaka.bg_alt })
      set_hl(0, "NoiceConfirmBorder", { fg = arasaka.yellow, bg = arasaka.bg_alt })

      -- nvim-notify
      set_hl(0, "NotifyINFOBorder", { fg = arasaka.cyan })
      set_hl(0, "NotifyINFOTitle", { fg = arasaka.cyan, bold = true })
      set_hl(0, "NotifyINFOIcon", { fg = arasaka.cyan })
      set_hl(0, "NotifyWARNBorder", { fg = arasaka.yellow })
      set_hl(0, "NotifyWARNTitle", { fg = arasaka.yellow, bold = true })
      set_hl(0, "NotifyWARNIcon", { fg = arasaka.yellow })
      set_hl(0, "NotifyERRORBorder", { fg = arasaka.red })
      set_hl(0, "NotifyERRORTitle", { fg = arasaka.red, bold = true })
      set_hl(0, "NotifyERRORIcon", { fg = arasaka.red })
      set_hl(0, "NotifyDEBUGBorder", { fg = arasaka.muted })
      set_hl(0, "NotifyDEBUGTitle", { fg = arasaka.muted })
      set_hl(0, "NotifyDEBUGIcon", { fg = arasaka.muted })
      set_hl(0, "NotifyTRACEBorder", { fg = arasaka.muted })
      set_hl(0, "NotifyTRACETitle", { fg = arasaka.muted })
      set_hl(0, "NotifyTRACEIcon", { fg = arasaka.muted })
      set_hl(0, "NotifyBackground", { bg = arasaka.bg_alt })

      -- indent-blankline
      set_hl(0, "IblIndent", { fg = "#1c2433" })
      set_hl(0, "IblScope", { fg = arasaka.cyan })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local arasaka = {
        bg = "#0a0f14",
        bg_alt = "#131923",
        muted = "#55606b",
        fg = "#93a1ad",
        yellow = "#f7f779",
        cyan = "#35f2ff",
        red = "#ff4d6d",
      }

      local theme = {
        normal = {
          a = { fg = arasaka.bg, bg = arasaka.yellow, gui = "bold" },
          b = { fg = arasaka.fg, bg = arasaka.bg_alt },
          c = { fg = arasaka.fg, bg = arasaka.bg },
        },
        insert = {
          a = { fg = arasaka.bg, bg = arasaka.cyan, gui = "bold" },
          b = { fg = arasaka.fg, bg = arasaka.bg_alt },
          c = { fg = arasaka.fg, bg = arasaka.bg },
        },
        visual = {
          a = { fg = arasaka.bg, bg = arasaka.red, gui = "bold" },
          b = { fg = arasaka.fg, bg = arasaka.bg_alt },
          c = { fg = arasaka.fg, bg = arasaka.bg },
        },
        replace = {
          a = { fg = arasaka.bg, bg = arasaka.red, gui = "bold" },
          b = { fg = arasaka.fg, bg = arasaka.bg_alt },
          c = { fg = arasaka.fg, bg = arasaka.bg },
        },
        command = {
          a = { fg = arasaka.bg, bg = arasaka.yellow, gui = "bold" },
          b = { fg = arasaka.fg, bg = arasaka.bg_alt },
          c = { fg = arasaka.fg, bg = arasaka.bg },
        },
        inactive = {
          a = { fg = arasaka.muted, bg = arasaka.bg_alt, gui = "bold" },
          b = { fg = arasaka.muted, bg = arasaka.bg_alt },
          c = { fg = arasaka.muted, bg = arasaka.bg },
        },
      }

      require("lualine").setup({
        options = {
          theme = theme,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode", fmt = function(str) return "SYS " .. str end } },
          lualine_b = { { "branch", fmt = function(str) return str ~= "" and "BR " .. str or str end } } ,
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "diagnostics" },
          lualine_y = { "filetype" },
          lualine_z = { { "location", fmt = function(str) return "LN " .. str end } },
        },
        tabline = {
          lualine_a = { "buffers" },
        },
      })
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
      cmdline = {
        view = "cmdline_popup",
        format = {
          cmdline = { icon = " ", title = " CMD " },
          search_down = { icon = "  ", title = " SCAN " },
          search_up = { icon = "  ", title = " SCAN " },
          filter = { icon = " ", title = " FILTER " },
          lua = { icon = " ", title = " LUA " },
          help = { icon = " ", title = " HELP " },
        },
      },
      routes = {
        { filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
      },
      views = {
        cmdline_popup = {
          border = { style = "single", padding = { 0, 1 } },
          position = { row = "40%", col = "50%" },
          size = { width = 60, height = "auto" },
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#131923",
        fps = 30,
        render = "compact",
        stages = "fade",
        timeout = 3000,
        top_down = true,
        max_width = 50,
      })
      vim.notify = notify
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│", highlight = "IblIndent" },
      scope = { enabled = true, show_start = false, show_end = false, highlight = "IblScope" },
      exclude = { filetypes = { "help", "alpha", "dashboard", "lazy", "mason", "notify" } },
    },
  },
}
