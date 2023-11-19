return {
	'Exafunction/codeium.vim',
	dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end,
	event = 'VeryLazy',
}

