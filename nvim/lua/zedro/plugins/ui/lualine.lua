return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = {
				theme = 'dracula',
			},
			sections = {
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

				},
			},
		})
	end,
}
