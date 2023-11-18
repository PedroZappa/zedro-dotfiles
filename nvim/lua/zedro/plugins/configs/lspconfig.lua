local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- [ Disregard IDE warning: They shouldn't effect the config ]
local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
	"lua-language-server",
	"html",
	"cssls",
	"tsserver",
	"clangd",
	"pylyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Call setup function of 'clangd' on lspconfig plugin
-- lspconfig.clangd.setup {
--   -- add function for on_attach value
--   on_attach = function (client, bufnr)
--     -- small overrides to fix bug within NvChad & 'clangd'
--     client.server_capabilities.signatureHelpProvider = false
--     on_attach(client, bufnr)
--   end,
--   capabilities = capabilities,
-- }
