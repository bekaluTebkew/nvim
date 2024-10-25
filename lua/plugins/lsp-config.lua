return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        PATH = "prepend",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        -- Keybinding for code action
        vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })

        -- Keybinding for formatting and saving
        -- vim.keymap.set("n", "<leader>w", function()
        --   vim.lsp.buf.format({ bufnr = bufnr })
        --   vim.cmd("write")
        -- end, { buffer = bufnr })
      end
      -- Setting up LSP servers
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.emmet_language_server.setup({
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "cssls", "html", "emmet_language_server", 'eslint' },

      })
    end,
  },
}

