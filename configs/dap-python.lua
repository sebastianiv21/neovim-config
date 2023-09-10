local os_name = vim.loop.os_uname().sysname

-- python
if os_name == "Windows_NT" then
  local path = "%LOCALAPPDATA%\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe"
  require("dap-python").setup(path)
end

if os_name == "Linux" then
  local path = vim.fn.expand "$HOME/.local/share/nvim-data/mason/packages/debugpy/venv/bin/python"
  require("dap-python").setup(path)
end

require("core.utils").load_mappings "dap_python"
