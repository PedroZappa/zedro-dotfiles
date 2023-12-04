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
		-- Key mappings
		vim.keymap.set("n", "<leader>ccp", ":CccPick<CR>", { silent = true, desc = "Pick color"})
		vim.keymap.set("n", "<leader>ccr", ":CccConvert<CR>", { silent = true, desc = "Convert color"})
	end,
}
