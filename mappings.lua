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

-- more keybinds!

return M
