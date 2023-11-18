require("dap").adapters.lldb = {
	type = "executable",
	command = "/usr/bin/codelldb", -- adjust as needed
	name = "lldb",
}

local lldb = {
	name = "Launch lldb",
	type = "codelldb", -- matches the adapter
	request = "launch", -- could also attach to a currently running process
	program = function()
		return vim.fn.input(
			"Path to executable: ",
			vim.fn.getcwd() .. "/",
			"file"
		)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}

require('dap').configurations.c = {
	codelldb -- different debuggers or more configurations can be used here
}
