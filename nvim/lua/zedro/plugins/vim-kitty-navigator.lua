return {
	'knubie/vim-kitty-navigator',
	event = 'VeryLazy',
	build = function(plugin)
		vim.fn.system('cp ' .. plugin.dir .. '/*.py ~/.config/kitty/')
	end,
}
