return {
  "j-hui/fidget.nvim",
  opts = {
    -- options
  },
  config = function ()
    require("fidget").setup({
      -- Options related to notification subsystem
      notification = {
        poll_rate = 10,           -- How frequently to update and render notifications
        filter = vim.log.levels.INFO, -- Minimum notifications level
        history_size = 128,       -- Number of removed messages to retain in history
        override_vim_notify = false, -- Automatically override vim.notify() with Fidget
        configs =                 -- How to configure notification groups when instantiated
        { default = require("fidget.notification").default_config },
        redirect =                -- Conditionally redirect notifications to another backend
          function (msg, level, opts)
            if opts and opts.on_open then
              return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
            end
          end,

        -- Options related to how notifications are rendered as text
        view = {
          stack_upwards = true, -- Display notification items from bottom to top
          icon_separator = " ", -- Separator between group name and icon
          group_separator = "---", -- Separator between notification groups
          group_separator_hl = -- Highlight group used for group separator
          "Comment",
          render_message =     -- How to render notification messages
            function (msg, cnt)
              return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
            end,
        },

        -- Options related to the notification window and buffer
        window = {
          normal_hl = "Comment", -- Base highlight group in the notification window
          winblend = 100,    -- Background color opacity in the notification window
          border = "none",   -- Border around the notification window
          zindex = 45,       -- Stacking priority of the notification window
          max_width = 0,     -- Maximum width of the notification window
          max_height = 0,    -- Maximum height of the notification window
          x_padding = 1,     -- Padding from right edge of window boundary
          y_padding = 0,     -- Padding from bottom edge of window boundary
          align = "bottom",  -- How to align the notification window
          relative = "editor", -- What the notification window position is relative to
        },
      },
    })
  end,
}
