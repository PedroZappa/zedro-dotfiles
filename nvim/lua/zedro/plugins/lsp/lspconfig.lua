return {
  "neovim/nvim-lspconfig",
	cmd = {'LspInfo', 'LspInstall', 'LspStart'},
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
		{'williamboman/mason-lspconfig.nvim'},
  },
	config = function()
		local lsp_zero = require('lsp-zero')
		lsp_zero.extend_lspconfig()

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({buffer = bufnr})
		end)

		require('mason-lspconfig').setup({
			ensure_installed = {},
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					-- (Optional) Configure lua language server for neovim
					local lua_opts = lsp_zero.nvim_lua_ls()
					require('lspconfig').lua_ls.setup(lua_opts)
				end,
			}
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end
}
