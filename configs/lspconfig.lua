local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- organize imports
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- if you just want default config for the servers then put them in a table
local servers = {
  -- web dev
  "html",
  "cssls",
  -- "tsserver",
  -- "eslint-lsp",
  "gopls",

  -- c and c++
  "clangd",

  -- python
  "pyright",
}

-- ts/js custom config
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
    -- commands = {
    --   OrganizeImports = {
    --     organize_imports,
    --     description = "Organize Imports",
    --   },
    -- },
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
