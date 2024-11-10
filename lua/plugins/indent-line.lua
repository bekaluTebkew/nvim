-- File: ~/.config/nvim/lua/plugins/indent-blankline.lua
return {
  -- Plugin details
  "lukas-reineke/indent-blankline.nvim",

  -- Use "ibl" as the main module
  main = "ibl",

  -- Options for indent-blankline.nvim configuration
  opts = {
    indent = { char = "│" }, -- Use "│" for indentation lines
    exclude = {
      -- File types to exclude from showing indent lines
      filetypes = { "help", "dashboard", "lspinfo", "packer", "TelescopePrompt", "TelescopeResults" },
      buftypes = { "terminal", "nofile" }, -- Buffer types to exclude
    },
    scope = {
      show_start = true, -- Show the start of the current context
      show_end = false,  -- Disable showing the end of the current context
    },
  },

  -- Setup function
  config = function(_, opts)
    require("ibl").setup(opts) -- Load and apply the provided options
  end,
}
