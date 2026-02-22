return {
  {
    "ishan9299/nvim-solarized-lua",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("solarized")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "solarized_dark",
        },
        sections = {
          lualine_c = { { "filename", path = 1 } },
        },
        tabline = {
          lualine_a = { "buffers" },
        },
      })
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
