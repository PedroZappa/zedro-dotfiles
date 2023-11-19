-- Mapping helper
---@param mode string
---@param key string
---@param result function | string
---@param desc? string
local map = function(mode, key, result, desc, opts)
	vim.keymap.set(mode, key, result, { noremap = true, silent = true, desc = desc }, opts)
end
local keymap = vim.keymap -- for conciseness
-- Close buffer 
keymap.set("n", "<leader>x", "<cmd>close<CR>", { desc = "close buffer" })

-- General Mappings
map("n", "<leader><leader>", "<cmd>so %<CR>", "Source Neovim")
-- Open Options
map("n", "<leader>o", ":vert options<CR>", "Open Options in a vertical split")
-- Close Buffer
map("n", "<leader>bd", ":clo<CR>", "Close active buffer")
-- Cycle through open buffers
map("n", "<tab>", ":bnext<CR>", "Next buffer")
map("n", "<shift><tab>", ":bprevious<CR>", "Previous buffer")
-- Replace Script
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace word from whole file")
-- Inserting lines
map("n", "o", "o<ESC>", "Insert new line below")
map("n", "O", "O<ESC>", "Insert new line above")

-- Resizing window
map("n", "<C-up>", "<C-w>+", "Up")
map("n", "<C-down>", "<C-w>-", "Down")
map("n", "<C-left>", "<C-w>>", "Left")
map("n", "<C-right>", "<C-w><", "Right")

-- Formatting
-- Trim Trailing blanks
map("n", "<leader>trm", ":%s/\\s\\+$//e<CR>", "Trim trailing blanks")

-- Nvim-tree mappings
map("n", "<C-n>", ":NvimTreeToggle<CR>", "NvimTree Toggle")
map("n", "<leader>e", ":NvimTreeFocus<CR>", "NvimTree Focus")
-- Undotree mappings
map("n", "<leader>u", ":UndotreeToggle<CR>", "Undotree Mappings")


-- Oil Mappings
map("n", "-", ":Oil --float<CR>", "Open Parent Directory with Oil")
-- LazyGit
map("n", "<leader>gg", ":LazyGit<CR>", "LazyGit")
-- Parrot Crash
map("n", "<leader>pl", ":term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:vs<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:vs<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:vs<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR><C-w>h:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR><C-w>h:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR><C-w>h:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set winbar=\"\"<CR>:set nonu<CR>:set nornu<CR>", "Parrot Crash")


-- map.general = {
-- 	n = {
-- 		-- Oil Mappings
-- 		["-"] = { ":Oil --float<CR>", "Open Parent Directory with Oil" },
-- 		-- Fugitive (Git integration) GitStatus
-- 		["<leader>gs"] = { ":Git<CR>", "GitStatus" },
-- 		-- LazyGit
-- 		["<leader>gg"] = { ":LazyGit<CR>", "LazyGit" },
-- 		-- Parrot Crash
-- 		["<leader>pl"] = {
-- 			":term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:vs<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:vs<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:vs<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR><C-w>h:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR><C-w>h:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR><C-w>h:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>:term curl parrot.live<CR>:set winbar=\"\"<CR>:set nonu<CR>:set nornu<CR>", "Parrot Party!!!"
-- 		},
-- 		-- Neorg Mappings
-- 		["<leader>ni"] = {":Neorg index<CR>", "Neorg ndex" },
-- 		["<leader>nj"] = {":Neorg journal today<CR>", "Neorg journal today" },
-- 	},
-- 	v = {
-- 		-- Move selected blocks of code around
-- 		["J"] = { ":m '>+1<CR>gv=gv", "Move selected lines down" },
-- 		["K"] = { ":m '<-2<CR>gv=gv", "Move selected lines up" },
-- 		-- Yank selection and search for it in C files
-- 		["<leader>ys"] = { ':<C-U>exe "grep /" .. escape(@", \'\\\\/\') .. "/ *.c *.h"<CR>', {noremap = true} },
-- 	},
-- }
--
