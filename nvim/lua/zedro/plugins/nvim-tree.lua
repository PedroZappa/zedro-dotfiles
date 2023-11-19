return {
	'nvim-tree/nvim-tree.lua',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require('nvim-tree')
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to green
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#34eb43 ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#34eb43 ]])
		-- Yellow Indent lines
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#e8eb34 ]])
		-- Transparent background
		vim.cmd([[ highlight NvimTreeNormal guibg=NONE ctermbg=NONE]])

		-- configure nvim-tree
		nvimtree.setup({
			view = {
				width = 30,
				relativenumber = true,
			},
			git = {
				enable = true,
			},
			-- change folder arrow icons
			renderer = {
				highlight_git = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
					show = {
						git = true,
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
