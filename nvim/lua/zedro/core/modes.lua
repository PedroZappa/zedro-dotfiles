-- Word Processor Mode Setter
function WordProcessor()
  -- movement changes
  vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
  vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})

  -- formatting text
  vim.opt_local.formatoptions = "1"
  vim.opt_local.expandtab = false
  vim.opt_local.wrap = true
  vim.opt_local.linebreak = true

  -- spelling and thesaurus
  vim.opt_local.spell = true
  vim.opt_local.spelllang = "en_us"
  vim.opt.thesaurus = vim.opt.thesaurus + "/home/test/.vim/thesaurus/mthesaur.txt"

  -- complete+=s makes autocompletion search the thesaurus
  vim.opt.complete = vim.opt.complete + "s"
end
