return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local virtual_env = function()
      -- only show virtual env for Python
      if vim.bo.filetype ~= 'python' then
        return ""
      end
      local conda_env = os.getenv('CONDA_DEFAULT_ENV')
      local venv_path = os.getenv('VIRTUAL_ENV')
      if venv_path == nil then
        if conda_env == nil then
          return ""
        else
          return string.format("%s (conda)", conda_env)
        end
      else
        local venv_name = vim.fn.fnamemodify(venv_path, ':t')
        return string.format("%s (venv)", venv_name)
      end
    end

    lualine.setup({
      options = {
        theme = 'palenight',
        component_separators = { left = '', right = '' },
        -- component_separators = { left = '⵰', right = '⵰' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        -- Left side
        lualine_a = {
          { 'mode' },
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
          { virtual_env, color = { fg = "#e8eb34" } },
        },
        -- Right side
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'filename',
            path = 1, -- 0: Just the filename
            color = { fg = "#111111" },
          },
        },
        lualine_x = {
          {
            'location',
            color = { fg = "#111111" },
          }
        },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      inactive_winbar = {},
      extensions = {}

    })
  end,
}
