return {
	'mbbill/undotree',
	lazy = true,
	config = function()
		local keymap = vim.keymap -- for short
		keymap.set('n', '<leader>u', ':UndotreeToggle<CR>')
	end,
	event = 'VeryLazy',
}
