return {
	'uga-rosa/ccc.nvim',
	event = "VeryLazy",
	config = function()
		local ccc = require("ccc")
		local mapping = ccc.mapping

		ccc.setup({
			pickers = {
				-- Default colors came from Campbell (WindowsTerminal)
				ccc.picker.ansi_escape()
			},
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
			alpha_show = "auto",
			highlight_mode = "bg",
			recognize = {
				input = true,
				output = true,
			},
			inputs = {
				ccc.input.rgb,
				ccc.input.hsl,
				ccc.input.cmyk,
			}
		})
		-- enables highlighter when entering a buffer
		vim.cmd [[
			autocmd BufEnter * :CccHighlighterEnable
		]]
		-- Key mappings
		vim.keymap.set("n", "<leader>ccp", ":CccPick<CR>", { silent = true, desc = "Pick color" })
		vim.keymap.set("n", "<leader>ccr", ":CccConvert<CR>", { silent = true, desc = "Convert color" })
	end,
}
