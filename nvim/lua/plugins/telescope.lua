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
    end,
  },
}
