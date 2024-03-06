return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	event = "VeryLazy",
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
		'xiyaowong/telescope-emoji.nvim',
		"nvim-tree/nvim-web-devicons",
		'cljoly/telescope-repo.nvim',
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup{
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {},
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<C-h>"] = "which_key",
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					}
				}
			},
			pickers = {
				initial_mode = "normal",
				find_files = {
					hidden = true
				}
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				emoji = {
					action = function(emoji)
						-- argument emoji is a table.
						-- {name="", value="", cagegory="", description=""}

						vim.fn.setreg("*", emoji.value)
						print([[Press p or "*p to paste this emoji]] .. emoji.value)

						-- insert emoji when picked
						-- vim.api.nvim_put({ emoji.value }, 'c', false, true)
					end,
				},
				repo = {
					list = {
						fd_opts = {
							"--no-ignore-vcs",
						},
						search_dirs = {
							"~/my_projects",
						},
					},
				},
			}
		}

		require("telescope").load_extension("emoji")
		require("telescope").load_extension("repo")
		require("telescope").load_extension('harpoon')

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
		vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Grep string" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[F]ind [H]elp tags" })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
		vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
		vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
		vim.keymap.set('n', '<leader>fe', ":Telescope emoji<CR>", { desc = "Emoji" })
		vim.keymap.set('n', '<leader>fr', ":Telescope repo list<CR>", { desc = "Repo" })
		vim.keymap.set('n', '<leader>fn', ":Telescope notify<CR>", { desc = "Notifications in Telescope" })
		vim.keymap.set("n", "<leader>fcm", ":Telescope git_commits<CR>", { desc = "Git commits" })
		vim.keymap.set("n", "<leader>gt", ":Telescope git_status<CR>", { desc = "Git status" })
		vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "[G]o to [D]efinition" })
		vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "[G]o to [R]eferences" })
		vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = "[G]o to [I]mplementations" })
		vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
		vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "[R]e[n]ame variable" })
	end,
}
