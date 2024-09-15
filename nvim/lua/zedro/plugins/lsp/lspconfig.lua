return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_lspconfig()
		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		local project_include_dir = vim.loop.cwd() .. "/include"

		require('mason').setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "clangd", "lua_ls" },
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					require('lspconfig').lua_ls.setup({
						settings = {
							Lua = {
								format = {
									enable = true,
									defaultConfig = {
										indent_style = "space",
										indent_size = 2
									}
								},
								diagnostics = {
									globals = { "vim" }
								}
							}
						},
						on_init = function(client)
							local uv = vim.uv or vim.loop
							local path = client.workspace_folders[1].name

							-- Don't do anything if there is a project local config
							if uv.fs_stat(path .. '/.luarc.json')
								or uv.fs_stat(path .. '/.luarc.jsonc')
							then
								return
							end
							-- Apply neovim specific settings
							local lua_opts = lsp_zero.nvim_lua_ls()

							client.config.settings.Lua = vim.tbl_deep_extend(
								'force',
								client.config.settings.Lua,
								lua_opts.settings.Lua
							)
						end,
					})
				end,
				clangd = function()
					require("lspconfig").clangd.setup({
						cmd = { "clangd",
							"--compile-commands-dir=" .. vim.loop.cwd(),
							"--background-index",
							"--clang-tidy",
							"--suggest-missing-includes",
						},
						init_options = {
							clangdFileStatus = true,
							additionalIncludes = { project_include_dir },
							-- clangdFileWatched = true,
							fallbackFlags = {
								"-I" .. vim.loop.cwd() .. "/include", -- Custom include path
								"-I/usr/local/include", -- System-wide include
							}
						},
						filetypes = { "c", "h", "hpp", "cpp", "objc", "objcpp" },
						cmd_env = {
							CXXFLAGS = "-I/sgoinfre/homebrew/include",
							LDFLAGS = "-L/sgoinfre/homebrew/lib"
						},
					})
				end,
				pyright = function()
					require("lspconfig").pyright.setup({})
				end
			},
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
