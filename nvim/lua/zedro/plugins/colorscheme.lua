return {
	'Mofiqul/dracula.nvim',
	priority = 1000, -- Make sure it loads before all other plugins
	config = function()
		-- Load colorscheme
		vim.cmd([[
			colorscheme dracula
			highlight Normal guibg=none
			highlight NonText guibg=none
		]])
	end,
}

