return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  lazy = false,
  config = function()
    local lsp_zero = require('lsp-zero')
    local mason = require("mason")                     -- import mason
    local mason_lspconfig = require("mason-lspconfig") -- import mason-lspconfig
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✔️",
          package_pending = "➿",
          package_uninstalled = "💤",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = { "clangd", "lua_ls" },
      automatic_installation = true, -- not the same as ensure_installed
      handlers = {
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
        lsp_zero.default_setup,
        lua_ls = function()
          require('lspconfig').lua_ls.setup({
            on_init = function(client)
              local uv = vim.uv or vim.loop
              local path = client.workspace_folders[1].name

              lsp_zero.nvim_lua_settings(client, {})
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
            settings = {
              Lua = {
                format = {
                  enable = true,
                  defaultConfig = {
                    tab_width = 2,
                    indent_style = "space",
                    indent_width = 2,
                    continuation_indent = 2,
                  },
                },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                  },
                  maxPreload = 100000,
                  preloadFileSize = 10000,
                },
              },
            },
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
                "-I/usr/local/include",               -- System-wide include
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
          require("lspconfig").pyright.setup({
            cmd = { "pyright-langserver", "--stdio" },
            filetypes = { "python" },
            single_file_support = false,
            -- root_dir = function()
            --   return vim.fn.cwd()
            -- end,
            settings = {
              python = {
                analysis = {
                  autoSearchPaths = true,
                  diagnosticMode = "openFilesOnly",
                  useLibraryCodeForTypes = true
                }
              }
            }

          })
        end,
        -- ast_grep = function()
        --   require("lspconfig").ast_grep.setup({
        --     cmd = { "astgrep", "lsp" },
        --     filetypes = { "python" },
        --     root_pattern = { 'sgconfig.yaml', 'sgconfig.yml' },
        --     single_file_support = false,
        --   })
        -- end,
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua",   -- lua formatter
        "eslint_d", -- js linter
      },
    })
  end,
}
