return {
	'knubie/vim-kitty-navigator',
	build = function(plugin)
		vim.fn.system('cp ' .. plugin.dir .. '/*.py ~/.config/kitty/')
	end,
}
