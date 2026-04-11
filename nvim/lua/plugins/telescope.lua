return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      {
        "<C-p>",
        function()
          local builtin = require("telescope.builtin")
          local cwd = vim.loop.cwd()
          local git_dir = vim.fn.finddir(".git", cwd .. ";")
          if git_dir ~= "" then
            builtin.git_files()
          else
            builtin.find_files()
          end
        end,
        desc = "Find project files",
      },
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          preview = {
            treesitter = { enable = false },
          },
          file_ignore_patterns = { "%.git/", "node_modules/", "tmp/" },
        },
      })
      require("telescope").load_extension("fzf")

      -- Arasaka highlight groups
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "TelescopeBorder", { fg = "#55606b", bg = "#0a0f14" })
      set_hl(0, "TelescopePromptBorder", { fg = "#55606b", bg = "#0a0f14" })
      set_hl(0, "TelescopeResultsBorder", { fg = "#55606b", bg = "#0a0f14" })
      set_hl(0, "TelescopePreviewBorder", { fg = "#55606b", bg = "#0a0f14" })
      set_hl(0, "TelescopePromptNormal", { fg = "#93a1ad", bg = "#0a0f14" })
      set_hl(0, "TelescopeResultsNormal", { fg = "#93a1ad", bg = "#0a0f14" })
      set_hl(0, "TelescopePreviewNormal", { fg = "#93a1ad", bg = "#0a0f14" })
      set_hl(0, "TelescopePromptPrefix", { fg = "#f7f779", bold = true })
      set_hl(0, "TelescopePromptTitle", { fg = "#0a0f14", bg = "#f7f779", bold = true })
      set_hl(0, "TelescopeResultsTitle", { fg = "#0a0f14", bg = "#35f2ff", bold = true })
      set_hl(0, "TelescopePreviewTitle", { fg = "#0a0f14", bg = "#ff4d6d", bold = true })
      set_hl(0, "TelescopeSelection", { fg = "#f7f779", bg = "#131923", bold = true })
      set_hl(0, "TelescopeSelectionCaret", { fg = "#ff4d6d" })
      set_hl(0, "TelescopeMatching", { fg = "#35f2ff", bold = true })
    end,
  },
}
