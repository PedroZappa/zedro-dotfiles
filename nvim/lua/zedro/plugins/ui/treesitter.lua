return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "javascript",
        "html",
        "markdown",
        "make",
      },
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ss",
          node_incremental = "<leader>si",
          scope_incremental = "<leader>sc",
          node_decremental = "<leader>sd",
        },
      },
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "v",  -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          include_surrounding_whitespace = true,
        },
      },
    })
  end,
}
