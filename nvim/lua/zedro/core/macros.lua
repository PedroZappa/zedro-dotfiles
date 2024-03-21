-- Define the Lua function to wrap selected text with HTML tags
local function wrapWithHtmlTag()
 -- Ask the user for the tag name
 local tag = vim.fn.input("Enter HTML tag: ")
 -- Wrap the selection with the entered tag
 vim.fn.surround(vim.fn.getpos("'<"), vim.fn.getpos("'>"), "<" .. tag .. ">", "</" .. tag .. ">")
end

-- Create a user command that calls the wrapWithHtmlTag function
vim.api.nvim_create_user_command('WrapWithHtmlTag', wrapWithHtmlTag, {})




