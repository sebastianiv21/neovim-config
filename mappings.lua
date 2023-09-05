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
  },
}

-- nvterm
local ft_cmds = {
  python = "python " .. vim.fn.expand "%:t",
}

M.nvterm = {
  n = {
    -- toggle terminal mode
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
    -- run file in terminal
    ["<leader>rt"] = {
      function()
        require("nvterm.terminal").send(ft_cmds[vim.bo.filetype], "float")
      end,
      "Run file in terminal",
    },
  },
  t = {
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}

-- more keybinds!

return M
