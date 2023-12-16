return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	event = "VeryLazy",
	opts = { -- require(bufferline).setup(opts)
		options = {
			mode = "buffers",
			themable = true,
			buffer_close_icon = '󰅖',
			modified_icon = '●',
			close_icon = '',
			left_trunc_marker = '',
			right_trunc_marker = '',
			tab_size = 18,
			diagnostics = "nvim_lsp",
			separator_style = "slant",
			hover = {
				enabled = true,
				delay = 200,
				reveal = {'close'}
			},
		},
	},
}
