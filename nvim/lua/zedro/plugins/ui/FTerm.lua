return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require'FTerm'
		local dimensions = {
			height = 0.7,
			width = 0.7,
			x = 0.5,
			y = 0.5,
		}

		-- floating terminal
		fterm.setup({
			border = 'double',
			dimensions= dimensions,
			hl = 'Normal',
		})

		-- floating xtop
		local htop = fterm:new({
			ftype = 'fterm_htop',
			cmd = 'htop',
			dimensions= dimensions,
			border = 'rounded',
		})
		vim.keymap.set('n', '<A-t>', function()
			htop:toggle()
		end)
		--
		-- Basic keybindings
		vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
