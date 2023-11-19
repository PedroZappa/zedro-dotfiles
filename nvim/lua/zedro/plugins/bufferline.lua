return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = { -- require(bufferline).setup(opts)
	options = {
		mode = "tabs",
		buffer_close_icon = '󰅖',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		tab_size = 18,
		separator_style = "slant",
		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},
	},
},
}
