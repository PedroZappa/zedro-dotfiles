return {
  'Mofiqul/dracula.nvim',
  priority = 1000, -- Make sure it loads before all other plugins
  config = function ()
    local dracula = require("dracula")
    dracula.setup({
      styles = {
        sidebars = "transparent", -- style for sidebars, see below
      },
      -- customize dracula color palette
      colors = {
        bg = "#282A36",
        fg = "#F8F8F2",
        selection = "#44475A",
        comment = "#6272A4",
        red = "#FF5555",
        orange = "#FFB86C",
        yellow = "#F1FA8C",
        green = "#50fa7b",
        purple = "#BD93F9",
        cyan = "#8BE9FD",
        pink = "#FF79C6",
        bright_red = "#FF6E6E",
        bright_green = "#69FF94",
        bright_yellow = "#FFFFA5",
        bright_blue = "#D6ACFF",
        bright_magenta = "#FF92DF",
        bright_cyan = "#A4FFFF",
        bright_white = "#FFFFFF",
        menu = "#21222C",
        visual = "#3E4452",
        gutter_fg = "#4B5263",
        nontext = "#3B4048",
        white = "#ABB2BF",
        black = "#191A21",
      },
      -- show the '~' characters after the end of buffers
      show_end_of_buffer = true, -- default false
      -- use transparent background
      transparent_bg = true,     -- default false
      -- set custom lualine background color
      lualine_bg_color = "#000000", -- default nil
      -- set italic comment
      italic_comment = true,     -- default false
      -- overrides the default highlights with table see `:h synIDattr`
      overrides = {},
      -- You can use overrides as table like this
      -- overrides = {
      --   NonText = { fg = "white" }, -- set NonText fg to white
      --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
      --   Nothing = {} -- clear highlight of Nothing
      -- },
      -- Or you can also use it like a function to get color from theme
      -- overrides = function (colors)
      --   return {
      --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
      --   }
      -- end,
    })
    -- Load colorscheme
    vim.cmd([[
			colorscheme dracula
			highlight Normal guibg=none
			highlight FloatBorder guifg=#e8eb34 guibg=#000000
			highlight NonText guibg=#000000
			highlight Search guibg=#34eb34
			highlight CurSearch guibg=#34eb34 guifg=#8426ff
			highlight WhichKey guifg=#34eb43
			highlight WhichKeyFloat guibg=#000001
			highlight WhichKeySeparator guifg=#8426ff
			highlight TelescopeNormal guibg=#000000
			highlight TelescopeSelection guibg=#674b94 guifg=#000000
			highlight TelescopePreviewBorder guifg=#34eb43
			highlight TelescopeResultsBorder guifg=#34eb43
			highlight TelescopePromptBorder guifg=#34eb43
			highlight TelescopeBorder guifg=#e6e600
			highlight TermCursor guifg=#34eb43
			highlight NormalFloat guibg=#000000
			highlight WinSeparator guifg=#8426ff guibg=#000000
			highlight NotifyBackground guibg=#000000
			highlight NoiceCmdlinePopupBorder guifg=#34eb43
			highlight NoiceCmdlineIcon guifg=#e6e600
			highlight BufferLineFill guibg=#000000
			highlight StatusLine guibg=#000000
			highlight NvimTreeWinSeparator guifg=#8426ff guibg=#000000
			highlight NvimTreeFolderArrowClosed guifg=#34eb43
			highlight NvimTreeFolderArrowOpen guifg=#34eb43
			highlight NvimTreeIndentMarker guifg=#e8eb34
			highlight NvimTreeNormal guibg=NONE ctermbg=NONE
			highlight NvimTreeRootFolder guibg=NONE ctermbg=NONE guifg=#69FF94
			highlight CursorLineNr guifg=#e8eb34
			highlight NvimTreeLineNr guifg=#34eb43
			highlight LineNr guifg=#D6ACFF
			highlight LspFloatWinBorder guifg=#e8eb34
			highlight LspFloatBorder guifg=#e8eb34
			highlight LspInfoBorder guifg=#e8eb34
      hi TreesitterContextBottom gui=underline guisp=Grey
      hi TreesitterContextLineNumberBottom gui=underline guisp=Grey
      hi NeoTreeBufferNumber guifg=#e8eb34
      hi NeoTreeCursorLine guifg=#34eb43 guibg=#000000 gui=underline
      hi NeoTreeTabActive guifg=#e8eb34 gui=bold
      hi NeoTreeTabSeparatorActive guibg=#8426ff guifg=#000000
      hi NeoTreeRootName guifg=#34eb43 gui=bold,italic
      hi NeoTreeIndentMarker guifg=#e8eb34
      hi NeoTreeSignColumn guifg=#e8eb34
      hi NeoTreeFileIcon guifg=green gui=bold
      hi NeoTreeDotfile guifg=#6272a4
      hi NeoTreeGitUnstaged guifg=#8426ff
      hi NeoTreeGitModified guifg=#8426ff
			hi NeoCodeiumLabel guibg=#34eb43 guifg=#000000
		]])
  end,
}
