local opt = vim.opt
-- local autocmd = vim.api.nvim_create_autocmd

-- Numbers
opt.relativenumber = true

-- Winbar
opt.winbar = "%=%m %f"

-- color column
opt.colorcolumn = "88"

-- Font configuration for GUI clients
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h18" -- Change the font size here (h18 = size 18)
  vim.g.neovide_scale_factor = 1.0
elseif vim.g.fvim_loaded then
  vim.o.guifont = "JetBrainsMono Nerd Font:h18"
elseif vim.fn.exists("g:vimr") then
  vim.o.guifont = "JetBrainsMono Nerd Font:h18"
end

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
