---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<A-i>"] = "",
  },
  t = {
    ["<A-i>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- center cursor
    ["<C-d>"] = { "<C-d>zz", "center on page down", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "center on page up", opts = { nowait = true } },
    ["n"] = { "nzzzv", "center on next word", opts = { nowait = true } },
    ["N"] = { "Nzzzv", "center on previous word", opts = { nowait = true } },
    -- do not copy on x
    ["x"] = { '"_x', "do not copy on x", opts = { nowait = true, noremap = true } },
    -- move lines
    ["<A-j>"] = { "<cmd>m .+1<cr>==", "move line down", opts = { nowait = true } },
    ["<A-k>"] = { "<cmd>m .-2<cr>==", "move line up", opts = { nowait = true } },
    -- go to
    ["H"] = { "^", "go to start of line (after whitespace)", opts = { nowait = true } },
    ["L"] = { "$", "go to end of line", opts = { nowait = true } },
    -- quit
    ["<leader>qq"] = { "<cmd>qa<cr>", "quit all", opts = { nowait = true } },
    -- search
    ["gw"] = { "*N", "search word under cursor", opts = { nowait = true } },
    ["gW"] = { "#N", "search word under cursor backwards", opts = { nowait = true } },
    ["<leader>fr"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "[S]earch and [R]eplace word",
      opts = { nowait = true },
    },
  },
  i = {
    -- move lines
    ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", "move line down", opts = { nowait = true } },
    ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", "move line up", opts = { nowait = true } },
    -- save file
    ["<C-s>"] = { "<cmd>w<cr><esc>", "save file", opts = { nowait = true } },
  },
  v = {
    -- move lines
    ["<A-j>"] = { ":m '>+1<cr>gv=gv", "move line up", opts = { nowait = true } },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", "move line down", opts = { nowait = true } },
    -- go to
    ["H"] = { "^", "go to start of line (after whItespace)", opts = { nowait = true } },
    ["L"] = { "$", "go to end of line", opts = { nowait = true } },
  },
  x = {
    -- move selected line / block of text in visual mode
    ["<A-j>"] = { ":move '>+1<CR>gv-gv", "move line up", opts = { nowait = true } },
    ["<A-k>"] = { ":move '<-2<CR>gv-gv", "move line down", opts = { nowait = true } },
    -- go to
    ["H"] = { "^", "go to start of line (after whitespace)", opts = { nowait = true } },
    ["L"] = { "$", "go to end of line", opts = { nowait = true } },
    -- save file
    ["<C-s>"] = { "<cmd>w<cr><esc>", "save file", opts = { nowait = true } },
    -- search
    ["gw"] = { "*N", "search word under cursor", opts = { nowait = true } },
    ["gW"] = { "#N", "search word under cursor backwards", opts = { nowait = true } },
    ["<leader>fr"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "[F]ind and [R]eplace word in current file",
      opts = { nowait = true },
    },
  },
}

-- toggleTerm
-- local Terminal = require("toggleterm.terminal").Terminal
-- local T = {}

-- T.on_open = function(term)
--   vim.cmd "startinsert!"
--   vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
-- end

-- T.on_close = function(term)
--   vim.cmd "startinsert!"
-- end

-- local lazygit = Terminal:new {
--   cmd = "lazygit",
--   dir = "git_dir",
--   direction = "float",
--   float_opts = {
--     border = "double",
--   },
--   -- function to run on opening the terminal
--   on_open = T.on_open(),
--   -- function to run on closing the terminal
--   on_close = T.on_close(),
-- }

-- function _lazygit_toggle()
--   lazygit:toggle()
-- end

-- local ft_cmds = {
--   python = "python " .. vim.fn.expand "%:t",
-- }
--
-- M.toggleTerm = {
--   n = {
--     -- open lazygit
--     ["<leader>gg"] = {
--       "<cmd>lua _lazygit_toggle()<CR>",
--       "Open Lazy[G]it",
--       opts = { nowait = true, silent = true },
--     },
--     -- run file in terminal
--     ["<leader>rt"] = {
--       function()
--         require("nvterm.terminal").send(ft_cmds[vim.bo.filetype], "float")
--       end,
--       "Run file in terminal",
--     },
--   },
--   t = {
--     ["<A-f>"] = {
--       function()
--         require("nvterm.terminal").toggle "float"
--       end,
--       "Toggle floating term",
--     },
--   },
-- }

-- more keybinds!

return M
