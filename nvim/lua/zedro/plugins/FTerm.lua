return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require'FTerm'
		local dimensions = {
			height = 0.7,
			width = 0.7,
		}

		fterm.setup({
			border = 'double',
			dimensions= dimensions,
		})

		-- Basic keybindings
		vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		-- floating xtop
		local htop = fterm:new({
			ftype = 'fterm_htop',
			cmd = 'htop',
			dimensions= dimensions,
		})
		vim.keymap.set('n', '<A-t>', function()
			htop:toggle()
		end)
	end,
}
