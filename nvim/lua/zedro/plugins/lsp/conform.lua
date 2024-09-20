return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
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
        lua = { "stylua",
			indent_style = "space",
			tab_width = 2
		},
        python = { "isort", "black" },
        bash = { "beautysh" },
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>pf", function()
      conform.format({
        lsp_fallback = false,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Make file or range PRETTY (v/n mode)" })
  end,
}
