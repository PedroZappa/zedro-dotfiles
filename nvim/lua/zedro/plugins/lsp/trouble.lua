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
        -- Add your key mappings here
        -- For example:
        ["?"] = "help",
        r = "refresh",
        R = "toggle_refresh",
        q = "close",
        o = "jump_close",
        ["<esc>"] = "cancel",
        ["<cr>"] = "jump",
        -- ... (add other key mappings as needed)
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
        symbols = {
          desc = "document symbols",
          mode = "lsp_document_symbols",
          focus = false,
          win = { position = "right" },
          filter = {
            ["not"] = { ft = "lua", kind = "Package" },
            any = {
              ft = { "help", "markdown" },
              kind = {
                "Class", "Constructor", "Enum", "Field", "Function", "Interface",
                "Method", "Module", "Namespace", "Package", "Property", "Struct", "Trait",
              },
            },
          },
        },
      },
      icons = {
        indent = {
          top = "│ ",
          middle = "├╴",
          last = "└╴",
          fold_open = " ",
          fold_closed = " ",
          ws = "  ",
        },
        folder_closed = " ",
        folder_open = " ",
        kinds = {
          Array = " ",
          Boolean = "󰨙 ",
          Class = " ",
          -- ... (add other kind icons as needed)
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
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
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
