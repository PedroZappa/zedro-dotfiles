return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = 'dracula',
				component_separators = { left = '', right = '' },
				-- component_separators = { left = '⵰', right = '⵰' },
				section_separators = { left = '', right = '' },
				-- section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				}
			},
			sections = {
				-- Left side
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = {
					{
						function()
							local ok, pomo = pcall(require, "pomo")
							if not ok then
								return ""
							end
							local timer = pomo.get_first_to_finish()
							if timer == nil then
								return ""
							end
							return "⏲  " .. tostring(timer)
						end,
						"encoding",
					},
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
				-- Right side
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {
				lualine_z = {
					{
						'filename',
						file_status = true, -- Displays file status (readonly status, modified status)
						newfile_status = true, -- Display new file status (new file means no write after created)
						path = 4,         -- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path
						-- 3: Absolute path, with tilde as the home directory
						-- 4: Filename and parent dir, with tilde as the home directory

						shorting_target = 70, -- Shortens path to leave n spaces in the window
						-- for other components. (terrible name, any suggestions?)
						symbols = {
							modified = '[⊕]', -- Text to show when the file is modified.
							readonly = '[⊘]', -- Text to show when the file is non-modifiable or readonly.
							unnamed = '[]', -- Text to show for unnamed buffers.
							newfile = '[New]', -- Text to show for newly created file before first write
						}
					}
				},
			},
			inactive_winbar = {},
			extensions = {}

		})
	end,
}
