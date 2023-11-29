-- Autocommands
--
local modes = require("modes")

-- FileType Autocommands
-- Tabstop 4
vim.api.nvim_exec([[
	augroup filetype_vim
		autocmd!
		autocmd FileType html,markdown setlocal tabstop=4 shiftwidth=4
	augroup END
]], false)
-- Tabstop 2
vim.api.nvim_exec([[
	augroup filetype_vim
		autocmd!
		autocmd FileType lua setlocal tabstop=2 shiftwidth=2
	augroup END
]], false)

-- enter Word Processor mode
vim.api.nvim_exec([[
	augroup filetype_vim
		autocmd!
		autocmd FileType txt 
		call WordProcessor()
	augroup END
]], false)

-- Spelling
--- Enable spell check for .md and .txt files
vim.cmd("autocmd BufRead,BufNewFile *.md,*.txt,*.norg setlocal spell")

-- Set the cursor line to have a line at the bottom
vim.cmd [[
	autocmd BufEnter * highlight CursorLine gui=underline
]]

-- Conceal in Neorg 
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = {"*.norg"},
	command = "set conceallevel=3"
})

-- Highlight on yank
vim.cmd [[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
]]

-- Turn off cursor when changing buffer
vim.cmd [[
	augroup cursor_off
		autocmd!
		autocmd WinLeave * set nocursorline nocursorcolumn
		autocmd WinEnter * set cursorline cursorcolumn
	augroup END
]]
