return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip", -- Snippet engine
			"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
			"hrsh7th/cmp-nvim-lsp", -- LSP completion source
			"hrsh7th/cmp-buffer", -- Buffer completion source
			"onsails/lspkind-nvim", -- Icons for completion
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp_status, cmp = pcall(require, "cmp")
			if not cmp_status then
				return
			end

			local lspkind = require("lspkind")

			-- Set up nvim-cmp
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For LuaSnip users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP source
					{ name = "path" }, -- LSP source
					-- { name = "luasnip" }, -- Snippet source
					{ name = "buffer" }, -- Buffer source
				}),
				formatting = {
					format = lspkind.cmp_format({
						with_text = true,
						maxwidth = 50,
					}),
				},
			})

			-- Set options for completion menu behavior
			vim.cmd([[
        set completeopt=menuone,noinsert,noselect
        highlight! default link CmpItemKind CmpItemMenuDefault
      ]])
		end,
	},
}
