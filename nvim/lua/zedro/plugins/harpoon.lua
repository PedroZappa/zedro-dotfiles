return {
	"theprimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = function()
		require("harpoon").setup({
			global_settings = {
				-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
				save_on_toggle = false,
				-- saves the harpoon file upon every change. disabling is unrecommended.
				save_on_change = true,
				-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
				enter_on_sendcmd = false,
				-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
				tmux_autoclose_windows = false,
				-- filetypes that you want to prevent from adding to the harpoon list menu.
				excluded_filetypes = { "harpoon" },
				-- set marks specific to each git branch inside git repository
				mark_branch = false,
				-- enable tabline with harpoon marks
				tabline = true,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
			},
			menu = {
				width = vim.api.nvim_win_get_width(0) - (vim.api.nvim_win_get_width(0) / 2) - 42,
			},
		})
	end,
	keys = {
		{ "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", desc = "Harpoon Add File" },
		{ "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon Toggle Menu" },
		{ "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon Nav File 1" },
		{ "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon Nav File 2" },
		{ "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon Nav File 3" },
		{ "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon Nav File 4" },
		{ "<leader>h5", ":lua require('harpoon.ui').nav_file(5)<CR>", desc = "Harpoon Nav File 5" },
		{ "<leader>h6", ":lua require('harpoon.ui').nav_file(6)<CR>", desc = "Harpoon Nav File 6" },
		{ "<leader>h7", ":lua require('harpoon.ui').nav_file(7)<CR>", desc = "Harpoon Nav File 7" },
		{ "<leader>h8", ":lua require('harpoon.ui').nav_file(8)<CR>", desc = "Harpoon Nav File 8" },
		{ "<leader>h9", ":lua require('harpoon.ui').nav_file(9)<CR>", desc = "Harpoon Nav File 9" },
		{ "<leader>h0", ":lua require('harpoon.ui').nav_file(0)<CR>", desc = "Harpoon Nav File 0" },
		{ "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", desc = "Harpoon Next File" },
		{ "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", desc = "Harpoon Prev File" },
	},
}
