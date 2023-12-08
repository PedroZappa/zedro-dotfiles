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

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
		vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Grep string" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set('n', '<leader>em', ":Telescope emoji<CR>", { desc = "Emoji" })
		vim.keymap.set('n', '<leader>re', ":Telescope repo list<CR>", { desc = "Repo" })
	end,
}
