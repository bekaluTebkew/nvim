-- ~/.config/nvim/lua/plugins/conform.lua

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettierd" },
				javascriptreact = { "prettierd" },
				css = { "prettierd" },
				javascript = { "prettierd" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
		})

		-- Keymap to manually format with Conform
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Manual format with Conform" })
	end,
	opts = {}, -- You can specify any additional options here if needed
}
