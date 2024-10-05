return {
  -- https://github.com/mfussenegger/nvim-dap-python
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
  },
  config = function()
    -- Update the path passed to setup to point to your system or virtual env python binary
    -- `python -m debugpy --version` must work in the shell
    require('dap-python').setup('python')
    -- require('dap-python').test_runner = 'pytest'
    -- require('dap-python').resolve_python = function()
    --   return '/absolute/path/to/python'
    -- end
  end
}
