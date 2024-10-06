return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("trouble").setup({
      auto_close = false,
      auto_open = false,
      auto_preview = true,
      auto_refresh = true,
      auto_jump = false,
      focus = false,
      restore = true,
      follow = true,
      indent_guides = true,
      max_items = 200,
      multiline = true,
      pinned = false,
      warn_no_results = true,
      open_no_results = false,
      win = {}, -- You can add specific window options here if needed
      preview = {
        type = "main",
        scratch = true,
      },
      throttle = {
        refresh = 20,
        update = 10,
        render = 10,
        follow = 100,
        preview = { ms = 100, debounce = true },
      },
      keys = {
        ["?"] = "help",
        r = "refresh",
        R = "toggle_refresh",
        q = "close",
        o = "jump_close",
        ["<esc>"] = "cancel",
        ["<cr>"] = "jump",
        ["<2-leftmouse>"] = "jump",
        ["<c-s>"] = "jump_split",
        ["<c-v>"] = "jump_vsplit",
        -- go down to next item (accepts count)
        -- j = "next",
        ["}"] = "next",
        ["]]"] = "next",
        -- go up to prev item (accepts count)
        -- k = "prev",
        ["{"] = "prev",
        ["[["] = "prev",
        dd = "delete",
        d = { action = "delete", mode = "v" },
        i = "inspect",
        p = "preview",
        P = "toggle_preview",
        zo = "fold_open",
        zO = "fold_open_recursive",
        zc = "fold_close",
        zC = "fold_close_recursive",
        za = "fold_toggle",
        zA = "fold_toggle_recursive",
        zm = "fold_more",
        zM = "fold_close_all",
        zr = "fold_reduce",
        zR = "fold_open_all",
        zx = "fold_update",
        zX = "fold_update_all",
        zn = "fold_disable",
        zN = "fold_enable",
        zi = "fold_toggle_enable",
        gb = { -- example of a custom action that toggles the active view filter
          action = function (view)
            view:filter({ buf = 0 }, { toggle = true })
          end,
          desc = "Toggle Current Buffer Filter",
        },
        s = { -- example of a custom action that toggles the severity
          action = function (view)
            local f = view:get_filter("severity")
            local severity = ((f and f.filter.severity or 0) + 1) % 5
            view:filter({ severity = severity }, {
              id = "severity",
              template = "{hl:Title}Filter:{hl} {severity}",
              del = severity == 0,
            })
          end,
          desc = "Toggle Severity Filter",
        },
      },
      modes = {
        lsp_references = {
          params = {
            include_declaration = true,
          },
        },
        lsp_base = {
          params = {
            include_current = false,
          },
        },
        -- more advanced example that extends the lsp_document_symbols
        symbols = {
          desc = "document symbols",
          mode = "lsp_document_symbols",
          focus = false,
          win = { position = "right" },
          filter = {
            -- remove Package since luals uses it for control flow structures
            ["not"] = { ft = "lua", kind = "Package" },
            any = {
              -- all symbol kinds for help / markdown files
              ft = { "help", "markdown" },
              -- default set of symbol kinds
              kind = {
                "Class",
                "Constructor",
                "Enum",
                "Field",
                "Function",
                "Interface",
                "Method",
                "Module",
                "Namespace",
                "Package",
                "Property",
                "Struct",
                "Trait",
              },
            },
          },
        },
        -- stylua: ignore
        icons = {
          ---@type trouble.Indent.symbols
          indent        = {
            top         = "│ ",
            middle      = "├╴",
            last        = "└╴",
            -- last          = "-╴",
            -- last       = "╰╴", -- rounded
            fold_open   = " ",
            fold_closed = " ",
            ws          = "  ",
          },
          folder_closed = " ",
          folder_open   = " ",
          kinds         = {
            Array         = " ",
            Boolean       = "󰨙 ",
            Class         = " ",
            Constant      = "󰏿 ",
            Constructor   = " ",
            Enum          = " ",
            EnumMember    = " ",
            Event         = " ",
            Field         = " ",
            File          = " ",
            Function      = "󰊕 ",
            Interface     = " ",
            Key           = " ",
            Method        = "󰊕 ",
            Module        = " ",
            Namespace     = "󰦮 ",
            Null          = " ",
            Number        = "󰎠 ",
            Object        = " ",
            Operator      = " ",
            Package       = " ",
            Property      = " ",
            String        = " ",
            Struct        = "󰆼 ",
            TypeParameter = " ",
            Variable      = "󰀫 ",
          },
        },
      },
    }) -- refer to the configuration section below
  end,
  opts = {
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>ts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>tdr",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
