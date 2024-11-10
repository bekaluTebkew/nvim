
-- File: ~/.config/nvim/lua/plugins/autopairs-and-ts-autotag.lua
return {
  -- nvim-ts-autotag: Automatically close and rename HTML/JSX tags
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact", -- JSX
          "typescriptreact", -- TSX
          "svelte",
          "vue",
          "xml",
          "php",
          "markdown", -- Optional: for markdown with embedded HTML
        },
      })
    end,
  },

  -- nvim-autopairs: Auto-completion for parentheses, brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- Treesitter integration (since you already have Treesitter configured)
      })

      -- If using nvim-cmp, integrate nvim-autopairs with it
      local cmp_status, cmp = pcall(require, "cmp")
      if cmp_status then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },
}


