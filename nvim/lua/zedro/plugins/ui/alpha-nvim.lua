return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    -- dashboard.section.header.val = {
    --   "                                                     ",
    --   "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    --   "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    --   "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    --   "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    --   "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    --   "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    --   "                                                     ",
    -- }

    -- Set menu
    dashboard.section.buttons.val = {
      { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
      { type = "padding", val = 1 },
      dashboard.button("f", "🔍  Find file", ":Telescope find_files <CR>"),
      dashboard.button("F", "🔤  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("n", "💡  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("t", "📺  Start Screen", ":e ~/.config/nvim/lua/core/startup-screen.lua <CR>"),
      dashboard.button("l", "♻   Get Lazy", ":Lazy<CR>"),
      dashboard.button("q", "🚪  Quit", ":qa<CR>"),
    }
    -- Send config to alpha
    alpha.setup(dashboard.opts)
  end,
}
