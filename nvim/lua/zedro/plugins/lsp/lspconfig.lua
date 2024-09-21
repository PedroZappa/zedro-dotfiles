return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function ()
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_lspconfig()
    lsp_zero.on_attach(function (client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    local project_include_dir = vim.loop.cwd() .. "/include"
    local custom_border = {
      { "╭", "LspFloatBorder" },
      { "─", "LspFloatBorder" },
      { "╮", "LspFloatBorder" },
      { "│", "LspFloatBorder" },
      { "╯", "LspFloatBorder" },
      { "─", "LspFloatBorder" },
      { "╰", "LspFloatBorder" },
      { "│", "LspFloatBorder" },
    }
    -- Set custom border style and color for LSP floating windows (including hover)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      {
        border = "rounded", -- Set border style: single, double, rounded, etc.
      }
    )
    require('mason').setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "lua_ls" },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function ()
          require('lspconfig').lua_ls.setup({
            on_init = function (client)
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
        clangd = function ()
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
        pyright = function ()
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

    -- lsp_attach is where you enable features that only work
    -- if there is a language server active in the file
    local lsp_attach = function (client, bufnr)
      local opts = { buffer = bufnr }
      local actions = require "telescope.actions"
      local actions_state = require "telescope.actions.state"
      local pickers = require "telescope.pickers"
      local finders = require "telescope.finders"
      local sorters = require "telescope.sorters"
      local dropdown = require "telescope.themes".get_dropdown()

      function dump(o)
        if type(o) == 'table' then
          local s = '{ '
          for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
          end
          return s .. '} '
        else
          return tostring(o)
        end
      end

      -- local colors = vim.fn.getcompletion("", "color")
      local cmd = { "fd", "-uu", "--type", "f", "--color", "never", "compile_commands.json" }

      local function enter(prompt_bufnr)
        local selected = actions_state.get_selected_entry()
        vim.cmd("!/bin/rm compile_commands.json")
        vim.cmd("!ln -s " .. selected[1] .. " .")
        vim.cmd("LspRestart")
        actions.close(prompt_bufnr)
      end

      local function next_color(prompt_bufnr)
        actions.move_selection_next(prompt_bufnr)
      end

      local function prev_color(prompt_bufnr)
        actions.move_selection_previous(prompt_bufnr)
      end

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
      vim.keymap.set("n", "<leader>lc", function ()
        local lc_opts = {
          finder = finders.new_oneshot_job(cmd, {}),
          sorter = sorters.get_generic_fuzzy_sorter({}),

          attach_mappings = function (prompt_bufnr, map)
            map("i", "<CR>", enter)
            map("i", "<C-j>", next_color)
            map("i", "<C-k>", prev_color)
            map("n", "<CR>", enter)
            map("n", "<C-j>", next_color)
            map("n", "<C-k>", prev_color)
            return true
          end,
        }

        pickers.new(dropdown, lc_opts):find()
      end, { desc = "[L]sp [C]onfig" })
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
