local keymap = vim.keymap -- for conciseness
-- General Mappings
-- Get Help
keymap.set("n", "<leader>h", ":vertical help ", { desc = "Get Help on..." })
-- Close buffer 
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader><leader>", "<cmd>so %<CR>", { desc = "Source Neovim" })
keymap.set("n", "<leader>o", ":vert options<CR>", { desc = "Open Options in a vertical split" })
-- Buffers
keymap.set("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR><CR>", { desc = "Close active buffer" })
keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
-- Resizing window
keymap.set("n", "<C-up>", "<C-w>+", { desc = "Up" })
keymap.set("n", "<C-down>", "<C-w>-", { desc = "Down" })
keymap.set("n", "<C-left>", "<C-w>>", { desc = "Left" })
keymap.set("n", "<C-right>", "<C-w><", { desc = "Right" })
-- Splitting windows
keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })

-- Terminals
-- Exit terminal
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal" })


-- Editing
-- Toggle Relative numbers
keymap.set("n", "<leader>rl", ":set relativenumber!<CR>", { desc = "Toggle relative numbers" })
-- Inserting lines
keymap.set("n", "<leader>o", "o<ESC>", { desc = "Insert new line below" })
keymap.set("n", "<leader>O", "O<ESC>", { desc = "Insert new line above" })
-- Replace Script
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace word from whole file" })
-- Trim Trailing blanks
keymap.set("n", "<leader>trm", ":%s/\\s\\+$//e<CR>", { desc = "Trim trailing blanks" })
-- Clear Highlights
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })


-- Plugins
-- Nvim-tree mappings
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "NvimTree Toggle" })
keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "NvimTree Focus" })
-- Undotree mappings
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undotree Toggle" })
-- Oil Mappings
keymap.set("n", "-", ":Oil --float<CR>", { desc = "Open Parent Directory with Oil" })
-- Git
keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })
keymap.set("n", "<leader>cm", ":Telescope git_commits<CR>", { desc = "Git commits" })
keymap.set("n", "<leader>gt", ":Telescope git_status<CR>", { desc = "Git status" })
keymap.set('n', '<leader>gs', ':Git<CR>')
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle Maximizer" })
-- Markdown Preview
keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Markdown Preview" })
-- nvim-cheat
keymap.set("n", "<leader>ch", ":Cheat<CR>", { desc = "Cheat Sheet" })
keymap.set("n", "<leader>cl", ":CheatList<CR>", { desc = "Cheat Sheet List" })
keymap.set("n", "<leader>cwc", ":CheatWithoutComments<CR>", { desc = "Cheat Sheet w/out Comments" })


-- Parrot Crash
keymap.set("n", "<leader>pl",
	":term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:vs<CR>" ..
	":term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR><C-w>h" ..
	":term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:vs<CR>" ..
	":term curl parrot.live<CR>:set nonu<CR>:set nornu<CR>:spl<CR>" ..
	":term curl parrot.live<CR>:set winbar=\"\"<CR>:set nonu<CR>:set nornu<CR>",
	{ desc = "Parrot Party!!!" }
)
-- Summon Pet
keymap.set("n", "<leader>sp", ":PetsNew Z", { desc = "Summon Pet" })
keymap.set("n", "<leader>scp", ":PetsNewCustom slime green Z", { desc = "Summon Custom Pet" })
keymap.set("n", "<leader>kp", ":PetsKill Z", { desc = "Kill Pet" })
