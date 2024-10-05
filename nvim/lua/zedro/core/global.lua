-- Set leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- vim.g.maplocalleader = "\\"
vim.g.RTP = vim.split(vim.o.runtimepath, ",")[1]
vim.g.RC = os.getenv("HOME") .. "/.config/nvim"

-- Set PATH
vim.cmd("set path=.,**")
-- Spell Path
vim.g.spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

-- Node.js Settings
vim.g.node_host_prog = '~/.nvm/versions/node/v20.11.1/bin/node'
vim.cmd("let $PATH = '/path/to/node/bin:' . $PATH")

-- 42 Header Settings
vim.g.user42 = 'passunca'
vim.g.mail42 = 'passunca@student.42porto.com'

-- Rest.nvim
vim.g.rest_nvim = {
    -- ...
}

-- Python Settings
vim.g.python3_host_prog = '/usr/bin/python3'
