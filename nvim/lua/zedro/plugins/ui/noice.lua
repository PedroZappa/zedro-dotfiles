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
    -- "rcarriga/nvim-notify",
    'stevearc/dressing.nvim',
  },
  config = function()
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
        enabled = false,
        view = "notify",
      },
      lsp = {
        progress = {
          enabled = true,
          -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
          -- See the section on formatting for more details on how to customize.
          --- @type NoiceFormat|string
          format = "lsp_progress",
          --- @type NoiceFormat|string
          format_done = "lsp_progress_done",
          throttle = 1000 / 30, -- frequency to update lsp progress message
          view = "mini",
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        -- hover = false,
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = true,
          silent = false, -- set to true to not show a message if hover is not available
          view = nil,     -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {},      -- merged with defaults from documentation
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50,  -- Debounce lsp signature help request by 50ms
          },
          view = nil,       -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {},        -- merged with defaults from documentation
        },
        message = {
          -- Messages shown by lsp servers
          enabled = true,
          view = "notify",
          opts = {},
        },
        -- defaults for hover and signature help
        documentation = {
          view = "hover",
          ---@type NoiceViewOptions
          opts = {
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            win_options = { concealcursor = "n", conceallevel = 3 },
          },
        },
      },
      markdown = {
        hover = {
          ["|(%S-)|"] = vim.cmd.help,                   -- vim help links
          ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
        },
        highlights = {
          ["|%S-|"] = "@text.reference",
          ["@%S+"] = "@parameter",
          ["^%s*(Parameters:)"] = "@text.title",
          ["^%s*(Return:)"] = "@text.title",
          ["^%s*(See also:)"] = "@text.title",
          ["{%S-}"] = "@parameter",
        },
      },
      health = {
        checker = true, -- Disable if you don't want health checks to run
      },
      views = {
        cmdline_popup = {
          position = {
            row = "10%",
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
    -- vim.notify = require("notify")

  end,
}
