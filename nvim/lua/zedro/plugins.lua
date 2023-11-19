local plugins = {
	-- {
	-- 	'neovim/nvim-lspconfig',
	-- 	config = function ()
	-- 		-- Zedro's config
	-- 		require 'plugins.lspconfig'
	-- 	end
	-- },
	-- Nvim-tree
	{
		'nvim-tree/nvim-tree.lua',
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup ({
				sort_by = "case_sensitive",
				view = {
					width = 30,
					adaptive_size = true,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},

			})
		end,
	};
	-- Undotree
	{
		'mbbill/undotree',
		event = 'VeryLazy',
	},
	-- Fugitive (Git Integration)
	{
		'tpope/vim-fugitive',
		event = 'VeryLazy',
	},
	-- Codeium
	{
		'Exafunction/codeium.vim',
		event = 'VeryLazy',
	},
	-- Github Copilot
	{
		'github/copilot.vim',
		event = 'VeryLazy',
	},
	-- vim-tmux-navigator
	{
		'christoomey/vim-tmux-navigator',
		event = 'VeryLazy',
	},
	-- Comment
	{
		'numToStr/Comment.nvim',
		lazy = false,
	},
	-- Colorizer
	{
		'uga-rosa/ccc.nvim',
		event = 'VeryLazy',
	},
	-- Lazygit
	{
		"kdheepak/lazygit.nvim",
		event = 'VeryLazy',
		-- optional for floating window border decoration
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim"
		},
	},
	-- 42Header
	{
		"42Paris/42header",
		event = "VeryLazy",
	},
	-- Markdown Preview
	-- {
	--   "iamcco/markdown-preview.nvim",
	--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	--   build = "cd app && yarn install",
	--   init = function()
	-- 	vim.g.mkdp_filetypes = { "markdown" }
	--   end,
	--   ft = { "markdown" },
	-- },
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	build = ":Neorg sync-parsers",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("neorg").setup {
	-- 			load = {
	-- 				["core.defaults"] = {}, -- Loads default behaviour
	-- 				["core.integrations.treesitter"] = {},
	-- 				["core.concealer"] = {
	-- 					config = {
	-- 						icon_preset = "diamond",
	-- 					},
	-- 				}, -- Adds pretty icons to your documents
	-- 				["core.dirman"] = { -- Manages Neorg workspaces
	-- 					config = {
	-- 						workspaces = {
	-- 							notes = "~/notes",
	-- 						},
	-- 						default_workspace = "notes",
	-- 					},
	-- 				},
	-- 				["core.pivot"] = {},
	-- 				["core.itero"] = {},
	-- 				["core.qol.toc"] = {
	-- 					config = {
	-- 						close_after_use = true,
	-- 					}
	-- 				},
	-- 				["core.summary"] = {},
	-- 				["core.esupports.metagen"] = {},
	-- 				["core.journal"] = {
	-- 					config = {
	-- 						journal_folder = "/notes",
	-- 					}
	-- 				},
	-- 				["core.qol.todo_items"] = {},
	-- 				["core.tangle"] = {},
	-- 			},
	-- 		}
	-- 	end,
	--
	-- 	event = 'VeryLazy',
	-- },
	-- Oil (baby!!!)
	-- {
	-- 	'stevearc/oil.nvim',
	-- 	-- Optional dependencies
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	event = 'VeryLazy',
	-- 	opts = function()
	-- 		return require 'plugins.oil'
	-- 	end,
	-- },
	-- vim-table-mode
	{
		'dhruvasagar/vim-table-mode',
		event = 'VeryLazy',
	},
	-- Cheatsheet for Neovim mappings
	{
		'sudormrfbin/cheatsheet.nvim',
		event = 'VeryLazy',
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
		},
	},
	-- cht.sh Integration
	{
		'RishabhRD/popfix',
		'RishabhRD/nvim-cheat.sh',
		event = 'VeryLazy',
	},
	-- Dracula Theme
	{
		'Mofiqul/dracula.nvim'
	},
	-- WhichKey
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	  end,
	  opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	  }
	}
	-- Color Picker
	-- {
	-- 	"ziontee113/color-picker.nvim";
	-- 	opts = function()
	-- 		return require 'plugins.color-picker'
	-- 	end,
	-- },
}

return plugins
