return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
        bash = { "beautysh" },
      },
      -- Set this to change the default values when calling conform.format()
      -- This will also affect the default values for format_on_save/format_after_save
      default_format_opts = {
        lsp_format = "fallback",
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>pf", function ()
      conform.format({
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
      })
    end, { desc = "Make file or range PRETTY (v/n mode)" })
  -- Format Python
    vim.keymap.set({ "n", "v" }, "<leader>fmp", ":silent !black %<CR>", { desc = "Make file or range PRETTY (v/n mode)" })
  end,
}
