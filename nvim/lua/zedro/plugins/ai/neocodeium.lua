return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function ()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<C-f>", function ()
      require("neocodeium").accept()
    end)
    vim.keymap.set("i", "<C-w>", function ()
      require("neocodeium").accept_word()
    end)
    vim.keymap.set("i", "<C-l>", function ()
      require("neocodeium").accept_line()
    end)
    vim.keymap.set("i", "<C-e>", function ()
      require("neocodeium").cycle_or_complete()
    end)
    vim.keymap.set("i", "<C-r>", function ()
      require("neocodeium").cycle_or_complete(-1)
    end)
    vim.keymap.set("i", "<C-x>", function ()
      require("neocodeium").clear()
    end)
  end,
}
