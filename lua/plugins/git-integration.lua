return {
  -- Fugitive for Git commands
  {
    'tpope/vim-fugitive',
  },

  -- Gitsigns for showing Git diff in the gutter
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '+' },
          change       = { text = '~' },
          delete       = { text = '-' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
        },
        numhl = true,               -- Highlight line numbers for changes
        current_line_blame = false, -- Show blame info on current line
      })


      vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
      vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'DiffChange' })
      vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'DiffDelete' })

      -- Keymaps for Gitsigns
      -- vim.api.nvim_set_keymap('n', ']c', '&diff ? "]c" : "<cmd>Gitsigns next_hunk<CR>"', { noremap = true, expr = true })
      -- vim.api.nvim_set_keymap('n', '[c', '&diff ? "[c" : "<cmd>Gitsigns prev_hunk<CR>"', { noremap = true, expr = true })
      --
      -- Actions
      -- vim.api.nvim_set_keymap('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>', { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>hb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true })
    end
  }
}
