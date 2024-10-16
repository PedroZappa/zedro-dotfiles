-- Lazy (Package Manager)
-- vim.loader.enable() -- cache lua modules (https://github.com/neovim/neovim/pull/22668)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = 'zedro.plugins' },
    { import = 'zedro.plugins.ui' },
    { import = 'zedro.plugins.ai' },
    { import = 'zedro.plugins.edit' },
    { import = 'zedro.plugins.git' },
    { import = 'zedro.plugins.lsp' },
    { import = 'zedro.plugins.nav' },
  },
  {
    checker = {
      enabled = true,
      notify = false,
    },
    -- Initialize lazy with dynamic loading of anything in the plugins directory
    change_detection = {
      enabled = true, -- automatically check for config file changes and reload the ui
      notify = true, -- turn off notifications whenever plugin changes are made
    },
  })
