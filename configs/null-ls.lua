local null_ls = require "null-ls"

local b = null_ls.builtins

-- format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
        vim.lsp.buf.format { async = false }
      end,
    })
  end
end

local sources = {
  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
  b.formatting.prettier,
  b.diagnostics.eslint,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  --python
  b.diagnostics.mypy,
  b.diagnostics.ruff,
  b.formatting.black,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
