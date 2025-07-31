local dap = require "dap"

-- Set DAP signs for better visibility
vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "🟦", texthl = "DapLogPoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "DapBreakpoint", linehl = "", numhl = "" })

-- nodejs/typescript debugging
dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  },
}

-- Chrome debugging (for web apps)
dap.adapters["pwa-chrome"] = {
  type = "server",
  host = "localhost",
  port = 9222,
  executable = {
    command = "js-debug-adapter",
  },
}

local js_based_languages = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    -- Debug single nodejs files
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
    -- Debug nodejs processes (backend servers)
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to process",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
    -- Debug web applications (frontend)
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chrome",
      url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:3000" }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      webRoot = "${workspaceFolder}",
      protocol = "inspector",
      sourceMaps = true,
      userDataDir = false,
    },
  }
end

-- Go debugging (if you use Go)
dap.adapters.delve = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "delve",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
}

-- Rust debugging (if you use Rust)
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
