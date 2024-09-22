return {
  -- -- 'Exafunction/codeium.nvim',
  -- 'Exafunction/codeium.vim',
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  --   "hrsh7th/nvim-cmp",
  -- },
  -- event = { "BufReadPre", "BufNewFile" },
  -- config = function ()
  --   -- require("codeium").setup({
  --   --   enable_chat = true,
  --   -- })
  --   local keymap = vim.keymap -- for short
  --   keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
  --   keymap.set('i', '<C->>', function () return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
  --   keymap.set('i', '<C-<>', function () return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  --   keymap.set('i', '<C-x>', function () return vim.fn['codeium#Clear']() end, { expr = true })
  --   -- keymap.set('n', '<C-c>', ":Codeium Chat<CR>", { desc = "Open Codeium Chat" })
  -- end
}
