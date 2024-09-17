return {
  "MrSloth-dev/42-NorminetteNvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function ()
    require("norminette").setup({
      auto_run = true,
      keybind = "<leader>n",
    })
  end,
}
