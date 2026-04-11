return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Arasaka highlight groups
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "CmpItemAbbrMatch", { fg = "#35f2ff", bold = true })
      set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#35f2ff" })
      set_hl(0, "CmpItemKindFunction", { fg = "#35f2ff" })
      set_hl(0, "CmpItemKindMethod", { fg = "#35f2ff" })
      set_hl(0, "CmpItemKindVariable", { fg = "#93a1ad" })
      set_hl(0, "CmpItemKindField", { fg = "#93a1ad" })
      set_hl(0, "CmpItemKindProperty", { fg = "#93a1ad" })
      set_hl(0, "CmpItemKindKeyword", { fg = "#ff4d6d" })
      set_hl(0, "CmpItemKindClass", { fg = "#35f2ff", bold = true })
      set_hl(0, "CmpItemKindStruct", { fg = "#35f2ff", bold = true })
      set_hl(0, "CmpItemKindInterface", { fg = "#35f2ff", bold = true })
      set_hl(0, "CmpItemKindModule", { fg = "#4da6ff" })
      set_hl(0, "CmpItemKindSnippet", { fg = "#ff9f1c" })
      set_hl(0, "CmpItemKindText", { fg = "#55606b" })
      set_hl(0, "CmpItemKindConstant", { fg = "#f7f779" })
      set_hl(0, "CmpItemKindValue", { fg = "#ff9f1c" })
    end,
  },
}
