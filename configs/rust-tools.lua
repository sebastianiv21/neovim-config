local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  tools = {
    autoSetHints = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  
  server = {
    on_attach = function(client, bufnr)
      -- Call the default on_attach function
      on_attach(client, bufnr)
      
      -- Additional rust-specific keybindings
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "<leader>rr", "<cmd>RustRunnables<cr>", opts)
      vim.keymap.set("n", "<leader>rt", "<cmd>lua _G.toggle_inlay_hints()<cr>", opts)
      vim.keymap.set("n", "<leader>rh", "<cmd>RustHoverActions<cr>", opts)
      vim.keymap.set("n", "<leader>rc", "<cmd>RustOpenCargo<cr>", opts)
    end,
    
    capabilities = capabilities,
    
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importEnforceGranularity = true,
          importPrefix = "crate",
        },
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          -- default: `cargo check`
          command = "clippy",
        },
        inlayHints = {
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true,
          },
        },
      },
    },
  },
  
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}

-- Toggle inlay hints function
_G.toggle_inlay_hints = function()
  if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
  end
end

return options
