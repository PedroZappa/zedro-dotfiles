return {
	'knubie/vim-kitty-navigator',
	lazy = true,
	build = function(plugin)
		vim.fn.system('cp ' .. plugin.dir .. '/*.py ~/.config/kitty/')
	end,
}
