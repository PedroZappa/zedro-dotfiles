return {
	"m4xshen/hardtime.nvim",
	-- command = "Hardtime",
	-- event = "BufEnter",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim"
	},
	opts = {
    enabled = false,
		disable_mouse = false,
		disabled_keys = {},
    disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "neo-tree" },
	}
}
