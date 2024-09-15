return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	lazy = true,
	init = function()
		-- Disable automatic setup, we are doing it manually
		vim.g.lsp_zero_extend_cmp = 0
		vim.g.lsp_zero_extend_lspconfig = 0
	end,
	config = function()
		local lsp_zero = require('lsp-zero')

		-- lsp_attach is where you enable features that only work
		-- if there is a language server active in the file
		local lsp_attach = function(client, bufnr)
			local opts = { buffer = bufnr }

			vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
			vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
			vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
			vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
			vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
			vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
			vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
			vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
			vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
			vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		end

		lsp_zero.extend_lspconfig({
			sign_text = true,
			lsp_attach = lsp_attach,
			capabilities = require('cmp_nvim_lsp').default_capabilities(),
		})
	end,
	keys = {
		{ "<leader>i", "<cmd>LspInfo<CR>",    desc = "Lsp-Zero Info" },
		{ "<leader>I", "<cmd>LspInstall<CR>", desc = "Lsp-Zero Install" },
	},
}
