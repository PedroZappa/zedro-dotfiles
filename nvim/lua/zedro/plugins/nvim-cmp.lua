return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		'neovim/nvim-lspconfig',			-- LSP
		"hrsh7th/cmp-buffer",				-- source for text in buffer
		"hrsh7th/cmp-path",				    -- source for file system paths
		'hrsh7th/cmp-cmdline',				-- source for cmdline
		-- 'hrsh7th/cmp-omni',				-- source for omnifunc
		"L3MON4D3/LuaSnip",					-- snippet engine
		"saadparwaiz1/cmp_luasnip",			-- for autocompletion
		"rafamadriz/friendly-snippets",		-- useful snippets
		"onsails/lspkind.nvim",				-- vs-code like pictograms
		-- { "quangnguyen30192/cmp-nvim-tags", ft = "markdown" },	-- nvim-tags
	},
	config = function()
		-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-2),
				["<C-f>"] = cmp.mapping.scroll_docs(2),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(),		-- close completion window
				["<C-y>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({ -- sources for autocompletion
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "cmdline" }, -- cmdline
				{
					name = 'tags',
					option = {
					  -- this is the default options, change them if you want.
					  -- Delayed time after user input, in milliseconds.
					  complete_defer = 100,
					  -- Max items when searching `taglist`.
					  max_items = 10,
					  -- Use exact word match when searching `taglist`, for better searching
					  -- performance.
					  exact_match = false,
					  -- Prioritize searching result for current buffer.
					  current_buffer_only = false,
				},
			  },
				-- { name = "codeium" }, -- codeium
			}),
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			formatting = {	-- configure lspkind for vs-code like pictograms in completion menu
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
