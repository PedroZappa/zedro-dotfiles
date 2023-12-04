return {
	'uga-rosa/ccc.nvim',
	event = "VeryLazy",
	config = function()
		local ccc = require("ccc")

		ccc.setup({
			pickers = {
				-- Default colors came from Campbell (WindowsTerminal)
				ccc.picker.ansi_escape()
			},
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		})

		-- enables highlighter when entering a buffer
		vim.cmd [[
			autocmd BufEnter * :CccHighlighterEnable
		]]
	end,
}
