local os_name = vim.loop.os_uname().sysname

-- python debugging setup
if os_name == "Windows_NT" then
  local path = "%LOCALAPPDATA%\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe"
  require("dap-python").setup(path)
elseif os_name == "Linux" then
  local path = vim.fn.expand "$HOME/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  require("dap-python").setup(path)
elseif os_name == "Darwin" then  -- macOS
  local path = vim.fn.expand "$HOME/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  require("dap-python").setup(path)
end

-- Additional Python debugging configurations
local dap = require "dap"

-- Enhanced Python configurations
dap.configurations.python = vim.list_extend(dap.configurations.python or {}, {
  {
    type = "python",
    request = "launch",
    name = "Launch file with arguments",
    program = "${file}",
    args = function()
      local args_string = vim.fn.input("Arguments: ")
      return vim.split(args_string, " +")
    end,
    console = "integratedTerminal",
    cwd = "${workspaceFolder}",
  },
  {
    type = "python",
    request = "launch",
    name = "Launch Django",
    program = "${workspaceFolder}/manage.py",
    args = { "runserver", "--noreload" },
    django = true,
    console = "integratedTerminal",
    cwd = "${workspaceFolder}",
  },
  {
    type = "python",
    request = "launch",
    name = "Launch Flask",
    program = "${workspaceFolder}/app.py",
    env = {
      FLASK_ENV = "development",
    },
    console = "integratedTerminal",
    cwd = "${workspaceFolder}",
  },
  {
    type = "python",
    request = "attach",
    name = "Attach remote",
    connect = function()
      local host = vim.fn.input("Host [127.0.0.1]: ")
      host = host ~= "" and host or "127.0.0.1"
      local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
      return { host = host, port = port }
    end,
  },
})

require("core.utils").load_mappings "dap_python"
