return {
  'mfussenegger/nvim-dap',
  event = "VeryLazy",
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    -- Dependency for ASIO
    'nvim-neotest/nvim-nio',
    -- Install debug adapters
    "williamboman/mason.nvim",
    'jay-babu/mason-nvim-dap.nvim',
    -- Telescope integration
    'nvim-telescope/telescope-dap.nvim',
    -- Language specific
    'mfussenegger/nvim-dap-python',
  },
  config = function ()
    local dap_ok, dap = pcall(require, "dap")
    if not (dap_ok) then
      print("nvim-dap not installed!")
      return
    end
    require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog

    local ui = require("dapui")

    -- DAP Packages Setup
    require("mason-nvim-dap").setup({
      automatic_installation = true, -- Attempts to set reasonable defaults
      ensure_installed = { "codelldm", "bash-debug-adapter" },
      -- see :help mason-nvim-dap on how to create custom handlers
      handlers = {},
    })
    -- UI : see |:help nvim-dap-ui|
    ui.setup({
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    })
    require("nvim-dap-virtual-text").setup({
      -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
      display_callback = function (variable)
        local name = string.lower(variable.name)
        local value = string.lower(variable.value)
        if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
          return "*****"
        end

        if #variable.value > 15 then
          return " " .. string.sub(variable.value, 1, 15) .. "... "
        end

        return " " .. variable.value
      end,
    })

    -- Adapter Configurations
    dap.adapters.lldb = {
      type = 'executable',
      command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
      name = 'lldb',
    }

    -- Event Listeners
    dap.listeners.before.attach.dapui_config = function ()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function ()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function ()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function ()
      ui.close()
    end
    dap.listeners.after.event_initialized.dapui_config = ui.open
  end,
  keys = function (_, keys)
    local dap = require('dap')
    local dapui = require('dapui')
    return {
      { '<F1>',      dap.continue,          desc = 'Debug: Start/Continue' },
      { '<F2>',      dap.step_into,         desc = 'Debug: Step Into' },
      { '<F3>',      dap.step_over,         desc = 'Debug: Step Over' },
      { '<F4>',      dap.step_out,          desc = 'Debug: Step Out' },
      { '<F5>',      dap.step_back,         desc = 'Debug: Step Back' },
      { '<F6>',      dap.restart,           desc = 'Debug: Restart' },
      { '<C-\\>',    dapui.toggle,          desc = 'DAP: Check last session results' },
      { '<leader>b', dap.toggle_breakpoint, desc = 'DAP: Toggle breakpoint' },
      {
        '<leader>B',
        function ()
          dap.set_breakpoint(vim.fn.input('DAP: Breakpoint condition: '))
        end,
        { desc = 'DAP: Set breakpoint' }
      },
      { '<leader>gb', dap.run_to_cursor, desc = 'DAP: Run to cursor' },
      {
        '<leader>?',
        function ()
          require("dapui").eval(nil, { enter = true })
        end,
        { desc = 'DAP: Evaluate expression under cursor' }
      },
      unpack(keys),
    }
  end,
}
