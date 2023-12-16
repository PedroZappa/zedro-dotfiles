-- Set leader and localleader
vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.g.RTP = vim.split(vim.o.runtimepath, ",")[1]
vim.g.RC = os.getenv("HOME") .. "/.config/nvim"

-- Set PATH
vim.cmd("set path=.,**")

-- 42 Header Settings
vim.g.user42 = 'passunca'
vim.g.mail42 = 'passunca@student.42porto.com'
