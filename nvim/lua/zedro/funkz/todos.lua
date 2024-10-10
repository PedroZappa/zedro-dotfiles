-- https://github.com/Piotr1215/dotfiles/blob/master/.config/nvim/lua/user_functions/todos.lua
local M = {}

function M.insert_todo_and_comment()
  -- Insert the TODO text at the current cursor position
  local line = vim.api.nvim_get_current_line()
  print("Original line: ", line)

  vim.api.nvim_put({ "TODO:(zedro)" }, "", true, true)
  -- Uncomment the line
  vim.cmd [[execute "normal \<Plug>NERDCommenterComment"]]
  vim.cmd [[execute "normal \A "]]
end

vim.api.nvim_set_keymap(
  "i",
  "<c-a>",
  "<C-o>:lua require('zedro.funkz.todos').insert_todo_and_comment()<CR>",
  { noremap = true, silent = true }
)

return M
