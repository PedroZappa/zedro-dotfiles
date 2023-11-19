-- Options
require("options")
-- Key Mappings
require("mappings")
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
-- Read from configs inside ~/.config/nvim/lua/zedro/plugins
require("lazy").setup("plugins", {
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = false,
    },
})

-- Theme
vim.cmd [[
	colorscheme dracula
	highlight Normal guibg=none
	highlight NonText guibg=none
]]

