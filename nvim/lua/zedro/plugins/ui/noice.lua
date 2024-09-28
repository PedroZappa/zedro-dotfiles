return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    'stevearc/dressing.nvim',
  },
  config = function ()
    local rounded_border_style = {
      top_left = "╭",
      top = "─",
      top_right = "╮",
      left = "│",
      right = "│",
      bottom_left = "╰",
      bottom = "─",
      bottom_right = "╯",
    }

    require("noice").setup({
      cmdline = {
        enabled = true,         -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = {},              -- global options for the cmdline. See section on views
        ---@type table<string, CmdlineFormat>
        format = {
          -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
          -- view: (default is cmdline view)
          -- opts: any options passed to the view
          -- icon_hl_group: optional hl_group for the icon
          -- title: set to anything or empty string to hide
          cmdline = { pattern = "^:", icon = " 𝝺 ", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " 🤔 ⮮", lang = "regex", title = " Search " },
          search_up = { kind = "search", pattern = "^%?", icon = " 🤔 ⮭", lang = "regex", title = " Search " },
          filter = { pattern = "^:%s*!", icon = "  ", lang = "bash", title = " Shell " },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "  ", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = " 🕮  ", title = " Help " },
          input = {}, -- Used by input()
          -- lua = false, -- to disable a format, set to `false`
        },
      },
      notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = true,
        view = "notify",
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        -- hover = false,
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      health = {
        checker = true, -- Disable if you don't want health checks to run
      },
      views = {
        cmdline_popup = {
          position = {
            row = "90%",
            col = "50%",

          },
          size = {
            width = "50%",
            height = "auto",
          },
          border = {
            -- style = rounded_border_style,
            -- style = "none",
          },
          filter_options = {},
          win_options = {
            winhighlight = { Normal = "TelescopePromptNormal", FloatBorder = "DiagnosticInfo" },
          },
        },
        split = {
          enter = true,
        },
        notify = {
          size = {
            width = 30
          }
        },
        popupmenu = {
          -- relative = "editor",
          position = {
            row = "90%",
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = rounded_border_style,
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "TelescopePromptNormal", FloatBorder = "DiagnosticInfo" },
          },
        },
      }, ---@see section on views
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      -- routes = {
      --   { filter = { find = "E162" },                                   view = "mini" },
      --   { filter = { event = "msg_show", kind = "", find = "written" }, view = "mini" },
      --   { filter = { event = "msg_show", find = "search hit BOTTOM" },  skip = true },
      --   { filter = { event = "msg_show", find = "search hit TOP" },     skip = true },
      --   { filter = { event = "emsg", find = "E23" },                    skip = true },
      --   { filter = { event = "emsg", find = "E20" },                    skip = true },
      --   { filter = { find = "No signature help" },                      skip = true },
      --   { filter = { find = "E37" },                                    skip = true },
      -- },
    })
    -- Setup notify for noice
    vim.notify = require("notify")

    require("notify").setup({
      background_colour = "#000000",
      fps = 30,
      icons = {
        DEBUG = " ",
        ERROR = " ",
        INFO = "🛈 ",
        TRACE = "✎",
        WARN = " "
      },
      level = 1,
      minimum_width = 30,
      maximum_width = 50,
      render = "compact",
      stages = "fade_in_slide_out",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
      },
      timeout = 300,
      top_down = false,
    })
  end,
}
