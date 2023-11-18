local plugins = {
	{
		'neovim/nvim-lspconfig',
		config = function ()
			-- NvChad config
			require 'plugins.configs.lspconfig'
			-- Zedro's config
			require 'custom.configs.lspconfig'
		end
	},
	-- DAP (Debug Adapter Protocol)
	{
		'mfussenegger/nvim-dap',
		config = function (_, _)
			-- Load DAP config
			require('custom.configs.nvim-dap')
			-- Explicitly load mappings on 'dap' table
			require('core.utils').load_mappings('dap')
		end
	},
	-- Closes gaps between 'mason' & 'nvim-dap'
	{
		'jay-babu/mason-nvim-dap.nvim',
		event = 'VeryLazy',
		dependencies = {
			'williamboman/mason.nvim',
			'mfussenegger/nvim-dap',
		},
		opts = {
			-- Empty handlers obj loads defaults
			handlers = {}
		}
	},
	-- nvim DAP UI improved
	{
		'rcarriga/nvim-dap-ui',
		event = 'VeryLazy',
		dependencies = 'mfussenegger/nvim-dap',
		-- Auto-Open UI when running the debugger
		config = function()
			local dap = require('dap')
			local dapui = require('dapui')
			dapui.setup()
			dap.listeners.after.event_initialized['dapui_config'] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},
	-- nvim-dap-virtual-text
	{
		'theHamsta/nvim-dap-virtual-text',
		event = 'VeryLazy',
	},
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
	{
	  "iamcco/markdown-preview.nvim",
	  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	  build = "cd app && yarn install",
	  init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	  end,
	  ft = { "markdown" },
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.integrations.treesitter"] = {},
					["core.concealer"] = {
						config = {
							icon_preset = "diamond",
						},
					}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
							default_workspace = "notes",
						},
					},
					["core.pivot"] = {},
					["core.itero"] = {},
					["core.qol.toc"] = {
						config = {
							close_after_use = true,
						}
					},
					["core.summary"] = {},
					["core.esupports.metagen"] = {},
					["core.journal"] = {
						config = {
							journal_folder = "/notes",
						}
					},
					["core.qol.todo_items"] = {},
					["core.tangle"] = {},
				},
			}
		end,

		event = 'VeryLazy',
	},
	-- Oil (baby!!!)
	{
		'stevearc/oil.nvim',
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = 'VeryLazy',
		opts = function()
			return require 'custom.configs.oil'
		end,
	},
	-- vim-table-mode
	{
		'dhruvasagar/vim-table-mode',
		event = 'VeryLazy',
	},
	-- Jupyter Notebooks 
	-- {
	-- 	"kiyoon/jupynium.nvim",
	-- 	build = "pip3 install --user .",
	-- 	opts = function()
	-- 		return require 'custom.configs.jupynium'
	-- 	end,
	-- 	-- build = "conda run --no-capture-output -n jupynium pip install .",
	-- 	-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
	-- },
	"rcarriga/nvim-notify",   -- optional
	"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
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
	-- Color Picker
	{
		"ziontee113/color-picker.nvim";
		opts = function()
			return require 'custom.configs.color-picker'
		end,
	},
}

return plugins
