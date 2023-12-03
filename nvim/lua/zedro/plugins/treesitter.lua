return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript", "html", "markdown" },
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
