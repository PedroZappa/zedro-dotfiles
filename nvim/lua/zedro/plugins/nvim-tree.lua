return {
	'nvim-tree/nvim-tree.lua',
	lazy = false,
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
			update_cwd = true,
			view = {
				width = 30,
				relativenumber = true,
			},
			git = {
				enable = true,
				ignore = false,
			},
			filesystem_watchers = {
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
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
					show = {
						git = true,
						file = true,
						folder = true,
						folder_arrow = false,
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
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
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
