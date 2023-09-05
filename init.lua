local opt = vim.opt
-- local autocmd = vim.api.nvim_create_autocmd

-- Numbers
opt.relativenumber = true

-- Winbar
opt.winbar = "%=%m %f"

-- color column
opt.colorcolumn = "80"

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
