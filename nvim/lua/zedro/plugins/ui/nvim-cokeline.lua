return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		"stevearc/resession.nvim" -- Optional, for persistent history
	},
	config = function()
		local get_hex = require('cokeline.hlgroups').get_hl_attr
		local purple = '#BD93F9'
		local green = '#50fa7b'
		-- Function to get diagnostic severity for a buffer
		local get_max_diagnostic_severity = function(buffer)
			local diagnostics = vim.diagnostic.get(buffer.number)
			local max_severity = nil

			for _, diagnostic in ipairs(diagnostics) do
				if not max_severity or diagnostic.severity < max_severity then
					max_severity = diagnostic.severity
				end
			end

			return max_severity
		end

		-- Function to determine the color based on diagnostics
		local get_name_fg_color = function(buffer)
			local severity = get_max_diagnostic_severity(buffer)
			if severity == vim.diagnostic.severity.ERROR then
				return get_hex('DiagnosticError', 'fg')
			elseif severity == vim.diagnostic.severity.WARN then
				return get_hex('DiagnosticWarn', 'fg')
			elseif severity == vim.diagnostic.severity.INFO then
				return get_hex('DiagnosticInfo', 'fg')
			elseif severity == vim.diagnostic.severity.HINT then
				return get_hex('DiagnosticHint', 'fg')
			else
				-- If no diagnostics, use the default color
				return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
			end
		end

		require('cokeline').setup({
			default_hl = {
				fg = function(buffer)
					return
						buffer.is_focused
						and get_hex('Normal', 'fg')
						or get_hex('Comment', 'fg')
				end,
				bg = 'NONE',
			},
			sidebar = {
				filetype = { 'NvimTree' },
				components = {
					{
						text = function(buf)
							return ' ' .. buf.filetype
						end,
						fg = purple,
						bg = function() return get_hex('NvimTreeNormal', 'bg') end,
						bold = true,
					},
				}
			},
			components = {
				{
					text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
					fg = function() return get_hex('Normal', 'fg') end
				},
				{
					text = function(buffer) return ' ' .. buffer.index .. "." end,
					fg = green,
				},
				{
					text = function(buffer) return ' ' .. buffer.devicon.icon end,
					fg = function(buffer) return buffer.devicon.color end,
				},
				{
					text = function(buffer) return buffer.unique_prefix end,
					fg = get_hex('Comment', 'fg'),
					italic = true
				},
				{
					text = function(buffer) return buffer.filename .. '   ' end,
					fg = get_name_fg_color,
					style = 'bold',
					bold = function(buffer) return buffer.is_focused end
				},
				{
					text = '󰖭',
					on_click = function(_, _, _, _, buffer)
						buffer:delete()
					end
				},
				{
					text = '  ',
				},
			},
		})
	end
}
