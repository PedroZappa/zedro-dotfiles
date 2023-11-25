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
	{ import = 'zedro.plugins.lsp' },
	{ import = 'zedro.plugins.colorschemes' },
	{ import = 'zedro.plugins.ctags' },
	}, {
	install = {
		colorscheme = { "dracula" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
