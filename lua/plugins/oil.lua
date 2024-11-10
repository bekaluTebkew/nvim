-- plugins/oil.lua

return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			-- You can add custom configurations here, like:
			float = {
				-- Padding around the floating window
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
				get_win_title = nil,
				-- preview_split: Split direction: "auto", "left", "right", "above", "below".
				preview_split = "auto",
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				override = function(conf)
					return conf
				end,
			},
			-- default_file_explorer = false,
			-- other settings...
		})
	end,
	keys = {
		{ "<leader>o", "<cmd>Oil<cr>", desc = "Open Oil File Explorer" },
	},
}
