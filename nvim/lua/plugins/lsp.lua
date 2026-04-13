return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()

      -- Arasaka highlight groups
      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "MasonHeader", { fg = "#0a0f14", bg = "#f7f779", bold = true })
      set_hl(0, "MasonHeaderSecondary", { fg = "#0a0f14", bg = "#35f2ff", bold = true })
      set_hl(0, "MasonHighlight", { fg = "#35f2ff" })
      set_hl(0, "MasonHighlightBlock", { fg = "#0a0f14", bg = "#35f2ff" })
      set_hl(0, "MasonHighlightBlockBold", { fg = "#0a0f14", bg = "#35f2ff", bold = true })
      set_hl(0, "MasonMuted", { fg = "#55606b" })
      set_hl(0, "MasonMutedBlock", { fg = "#93a1ad", bg = "#131923" })
      set_hl(0, "MasonError", { fg = "#ff4d6d" })
      set_hl(0, "MasonWarning", { fg = "#ff9f1c" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local has = function(bin)
        return vim.fn.executable(bin) == 1
      end

      local ensure_installed = {
        "clangd",
        "pyright",
        "solargraph",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "bashls",
        "sqlls",
        "marksman",
        "lua_ls",
        "texlab",
        "lemminx",
      }

      if has("go") then
        table.insert(ensure_installed, "gopls")
      end

      require("mason-lspconfig").setup({
        automatic_enable = false,
        ensure_installed = ensure_installed,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }

        -- GoTo code navigation (same as coc bindings)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        -- Hover docs
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- Diagnostics navigation
        vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)

        -- Rename
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- Format
        vim.keymap.set({ "n", "v" }, "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        -- Code action
        vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)

        -- Highlight references on cursor hold (only if server supports it)
        if client and client.supports_method("textDocument/documentHighlight") then
          vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.document_highlight()
            end,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.clear_references()
            end,
          })
        end
      end

      -- Configure each server directly (works with any mason-lspconfig version)
      local servers = {
        "clangd", "gopls", "pyright", "solargraph", "ts_ls",
        "html", "cssls", "jsonls", "yamlls", "bashls",
        "sqlls", "marksman", "texlab", "lemminx",
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = on_attach,
        })
        vim.lsp.enable(server)
      end

      -- lua_ls: suppress vim global warning
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      -- sourcekit-lsp: ships with Xcode, not installed via Mason
      vim.lsp.config("sourcekit", {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "xcrun", "sourcekit-lsp" },
      })
      vim.lsp.enable("sourcekit")

      -- Diagnostics/symbols pickers (replaces CocList)
      vim.keymap.set("n", "<space>a", vim.diagnostic.setloclist, { silent = true })
      vim.keymap.set("n", "<space>o", function()
        require("telescope.builtin").lsp_document_symbols()
      end, { silent = true })
      vim.keymap.set("n", "<space>s", function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols()
      end, { silent = true })
    end,
  },
}
