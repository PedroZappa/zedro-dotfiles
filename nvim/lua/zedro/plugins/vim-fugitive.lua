return {
	'tpope/vim-fugitive',
	config = function()
		local keymap = vim.keymap -- for short
		keymap.set('n', '<leader>gs', ':Git<CR>')
	end,
	event = 'VeryLazy',
}
