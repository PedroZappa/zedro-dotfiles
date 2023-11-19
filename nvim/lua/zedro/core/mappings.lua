-- Mapping helper
---@param mode string
---@param key string
---@param result function | string
---@param desc? string
local map = function(mode, key, result, desc, opts)
	vim.keymap.set(mode, key, result, { noremap = true, silent = true, desc = desc }, opts)
end

local keymap = vim.keymap -- for conciseness
-- General Mappings
-- Close buffer 
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader><leader>", "<cmd>so %<CR>", { desc = "Source Neovim" })
keymap.set("n", "<leader>o", ":vert options<CR>", { desc = "Open Options in a vertical split" })
-- Buffers
keymap.set("n", "<leader>bd", ":clo<CR>", { desc = "Close active buffer" })
keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<shift><tab>", ":bprevious<CR>", { desc = "Previous buffer" })
-- Replace Script
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace word from whole file" })
-- Inserting lines
-- keymap.set("n", "<leader>o", "o<ESC>", { desc = "Insert new line below" })
-- keymap.set("n", "<leader>O", "O<ESC>", { desc = "Insert new line above" })
-- Resizing window
keymap.set("n", "<C-up>", "<C-w>+", { desc = "Up" })
keymap.set("n", "<C-down>", "<C-w>-", { desc = "Down" })
keymap.set("n", "<C-left>", "<C-w>>", { desc = "Left" })
keymap.set("n", "<C-right>", "<C-w><", { desc = "Right" })
-- Formatting
-- Trim Trailing blanks
keymap.set("n", "<leader>trm", ":%s/\\s\\+$//e<CR>", { desc = "Trim trailing blanks" })
-- Nvim-tree mappings
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "NvimTree Toggle" })
keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "NvimTree Focus" })
-- Undotree mappings
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undotree Toggle" })

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
