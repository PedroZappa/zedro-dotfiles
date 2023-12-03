return {
	'uga-rosa/ccc.nvim',
	lazy = true,
	config = function()
		local ccc = require("ccc")

		ccc.setup({
			pickers = {
				-- Default colors came from Campbell (WindowsTerminal)
				ccc.picker.ansi_escape()
			}
		})
	end,
}
