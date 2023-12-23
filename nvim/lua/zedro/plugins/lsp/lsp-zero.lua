return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  lazy = true,
  config = false,
  init = function()
    -- Disable automatic setup, we are doing it manually
    vim.g.lsp_zero_extend_cmp = 0
    vim.g.lsp_zero_extend_lspconfig = 0
  end,
  keys = {
    { "<leader>i", "<cmd>LspInfo<CR>", desc = "Lsp-Zero Info" },
    { "<leader>I", "<cmd>LspInstall<CR>", desc = "Lsp-Zero Install" },
  },
}
