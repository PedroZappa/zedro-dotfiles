return {
	'Exafunction/codeium.vim',
	dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local keymap = vim.keymap -- for short
		keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
		keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
		keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
		keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
	end
}
