return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step In" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
      { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>du", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
    },
    config = function()
      local dapui = require("dapui")
      dapui.setup()

      -- Auto open/close UI on debug events
      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      -- Arasaka highlight groups
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "DapBreakpoint", { fg = "#ff4d6d", bg = "#0a0f14" })
      set_hl(0, "DapBreakpointCondition", { fg = "#ff9f1c", bg = "#0a0f14" })
      set_hl(0, "DapLogPoint", { fg = "#35f2ff", bg = "#0a0f14" })
      set_hl(0, "DapStopped", { fg = "#f7f779", bg = "#131923" })
      set_hl(0, "DapUIScope", { fg = "#35f2ff", bold = true })
      set_hl(0, "DapUIType", { fg = "#35f2ff" })
      set_hl(0, "DapUIValue", { fg = "#93a1ad" })
      set_hl(0, "DapUIVariable", { fg = "#93a1ad" })
      set_hl(0, "DapUIModifiedValue", { fg = "#f7f779", bold = true })
      set_hl(0, "DapUIDecoration", { fg = "#55606b" })
      set_hl(0, "DapUIThread", { fg = "#35f2ff" })
      set_hl(0, "DapUIStoppedThread", { fg = "#f7f779" })
      set_hl(0, "DapUISource", { fg = "#ff9f1c" })
      set_hl(0, "DapUILineNumber", { fg = "#55606b" })
      set_hl(0, "DapUIFloatBorder", { fg = "#55606b", bg = "#0a0f14" })
      set_hl(0, "DapUIWatchesValue", { fg = "#35f2ff" })
      set_hl(0, "DapUIWatchesEmpty", { fg = "#55606b" })
      set_hl(0, "DapUIWatchesError", { fg = "#ff4d6d" })
      set_hl(0, "DapUIBreakpointsPath", { fg = "#4da6ff" })
      set_hl(0, "DapUIBreakpointsInfo", { fg = "#35f2ff" })
      set_hl(0, "DapUIBreakpointsCurrentLine", { fg = "#f7f779", bold = true })
    end,
  },
}
