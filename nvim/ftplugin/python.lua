-- DAP & Python
keymap.set("n", '<leader>pdo', function()
  if vim.bo.filetype == 'python' then
    vim.api.nvim_command('PyrightOrganizeImports')
  end
end, { desc = "DAP: Organize Imports" })

keymap.set("n", '<leader>pdc', function()
  if vim.bo.filetype == 'python' then
    require('dap-python').test_class();
  end
end, { desc = "DAP: Debug python class" })

keymap.set("n", '<leader>tm', function()
  if vim.bo.filetype == 'python' then
    require('dap-python').test_method();
  end
end, { desc = "DAP: Debug python method" })

keymap.set("n", '<leader>pds', function()
  if vim.bo.filetype == 'python' then
    require('dap-python').debug_selection();
  end
end, { desc = "DAP: Debug python selection" })
