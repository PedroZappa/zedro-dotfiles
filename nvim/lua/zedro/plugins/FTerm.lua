return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require'FTerm'

		fterm.setup({
			border = 'double',
			dimensions  = {
				height = 0.9,
				width = 0.9,
			},
		})

		-- Basic keybindings
		vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		-- floating xtop
		vim.keymap.set('n', '<A-t>', function()
			if os.execute("which btop") then
				local btop = fterm:new({
					ftype = 'fterm_btop',
					cmd = 'btop',
				})
				btop:toggle()
			else
				local htop = fterm:new({
					ftype = 'fterm_htop',
					cmd = 'htop',
				})
				htop:toggle()
			end
		end)
	end,
}
