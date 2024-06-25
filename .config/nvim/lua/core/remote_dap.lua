local M = {}

M.attach_python_debugger = function(args)
	local dap = require("dap")
	local dapui = require("dapui")
	local host = args[1] -- This should be configured for remote debugging if your SSH tunnel is setup.
	-- You can even make nvim responsible for starting the debugpy server/adapter:
	--  vim.fn.system({"${some_script_that_starts_debugpy_in_your_container}", ${script_args}})
	pythonAttachAdapter = {
		type = "server",
		host = host,
		port = tonumber(7987),
	}
	pythonAttachConfig = {
		type = "python",
		request = "attach",
		connect = {
			port = tonumber(7987),
			host = host,
		},
		mode = "remote",
		name = "Remote Attached Debugger",
		cwd = vim.fn.getcwd(),
		pathMappings = {
			{
				localRoot = "/home/Philip.Capel/projects/mew/", -- Wherever your Python code lives locally.
				remoteRoot = "/app", -- Wherever your Python code lives in the container.
			},
		},
	}
	local session = dap.attach(pythonAttachAdapter, pythonAttachConfig, {})
	if session == nil then
		io.write("Error launching adapter")
	end
	dapui.open()
end

return M
