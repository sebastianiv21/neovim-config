---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<A-i>"] = "",
    ["<C-n>"] = "",
    ["<A-h>"] = "",
  },
  t = {
    ["<A-i>"] = "",
    ["<A-h>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- center cursor
    ["<C-d>"] = { "<C-d>zz", "center on page down", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "center on page up", opts = { nowait = true } },
    ["}"] = { "}zz", "center on paragraph down", opts = { nowait = true } },
    ["{"] = { "{zz", "center on paragraph up", opts = { nowait = true } },
    ["n"] = { "nzzzv", "center on next word", opts = { nowait = true } },
    ["N"] = { "Nzzzv", "center on previous word", opts = { nowait = true } },
    -- do not copy on x
    ["x"] = { '"_x', "do not copy on x", opts = { nowait = true, noremap = true } },
    -- move lines
    -- ["<A-j>"] = { "<cmd>m .+1<cr>==", "move line down", opts = { nowait = true } },
    -- ["<A-k>"] = { "<cmd>m .-2<cr>==", "move line up", opts = { nowait = true } },
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
    ["<leader>ge"] = {
      [[oif err != nil {<CR>  return<CR>}<ESC>kA ]],
      "[G]o [E]rror",
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
    -- ["<A-j>"] = { ":m '>+1<cr>gv=gv", "move line up", opts = { nowait = true } },
    -- ["<A-k>"] = { ":m '<-2<cr>gv=gv", "move line down", opts = { nowait = true } },
    -- go to
    ["H"] = { "^", "go to start of line (after whItespace)", opts = { nowait = true } },
    ["L"] = { "$", "go to end of line", opts = { nowait = true } },
  },
  x = {
    -- move selected line / block of text in visual mode
    -- ["<A-j>"] = { ":move '>+1<CR>gv-gv", "move line up", opts = { nowait = true } },
    -- ["<A-k>"] = { ":move '<-2<CR>gv-gv", "move line down", opts = { nowait = true } },
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

-- debugger
M.dap = {
  plugin = true,
  n = {
    -- Breakpoint management
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>", "Toggle [D]ebug [B]reakpoint" },
    ["<leader>dB"] = {
      function()
        vim.ui.input({ prompt = "Breakpoint condition: " }, function(condition)
          require("dap").set_breakpoint(condition)
        end)
      end,
      "Set conditional [D]ebug [B]reakpoint",
    },
    ["<leader>dL"] = {
      function()
        vim.ui.input({ prompt = "Log point message: " }, function(message)
          require("dap").set_breakpoint(nil, nil, message)
        end)
      end,
      "Set [D]ebug [L]og point",
    },
    
    -- Debug session control
    ["<leader>dr"] = { "<cmd>DapContinue<CR>", "[D]ebug [R]un/Continue" },
    ["<leader>ds"] = { "<cmd>DapStepOver<CR>", "[D]ebug [S]tep Over" },
    ["<leader>di"] = { "<cmd>DapStepInto<CR>", "[D]ebug Step [I]nto" },
    ["<leader>do"] = { "<cmd>DapStepOut<CR>", "[D]ebug Step [O]ut" },
    ["<leader>dt"] = { "<cmd>DapTerminate<CR>", "[D]ebug [T]erminate" },
    ["<leader>dR"] = { "<cmd>DapRestartFrame<CR>", "[D]ebug [R]estart Frame" },
    
    -- Debug UI
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle [D]ebug [U]I",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "[D]ebug [U]I [S]copes",
    },
    ["<leader>duf"] = {
      function()
        local widgets = require "dap.ui.widgets"
        widgets.centered_float(widgets.frames)
      end,
      "[D]ebug [U]I [F]rames",
    },
    ["<leader>duh"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "[D]ebug [U]I [H]over",
    },
    
    -- REPL and evaluation
    ["<leader>dre"] = { "<cmd>DapToggleRepl<CR>", "Toggle [D]ebug [RE]PL" },
    ["<leader>de"] = {
      function()
        vim.ui.input({ prompt = "Expression: " }, function(expr)
          if expr then
            require("dapui").eval(expr)
          end
        end)
      end,
      "[D]ebug [E]valuate expression",
    },
    
    -- Launch configurations
    ["<leader>dl"] = {
      function()
        require("dap").run_last()
      end,
      "[D]ebug [L]ast configuration",
    },
  },
  v = {
    ["<leader>de"] = {
      function()
        require("dapui").eval()
      end,
      "[D]ebug [E]valuate selection",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
      "[R]un [P]ython Test",
    },
  },
}

M.oil = {
  n = {
    ["-"] = { "<cmd>Oil<cr>", "Open [O]il in parent directory" },
  },
}

M.rest_nvim = {
  n = {
    ["<leader>rr"] = { "<Plug>RestNvim", "[R]est [R]equest" },
    ["<leader>rp"] = { "<Plug>RestNvimPreview", "[R]est [P]review" },
    ["<leader>rl"] = { "<Plug>RestNvimLast", "[R]est [L]ast [R]equest" },
  },
}

M.harpoon = {
  n = {
    ["<leader>mf"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "[M]ark [F]ile" },
    ["<leader>ms"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "[M]ark [S]how" },
  },
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "[R]ust [C]rates [U]pgrade",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd>GoTagAdd json<CR>",
      "Add [G]o [S]truct [J]SON [T]ag",
    },
    ["<leader>gsy"] = {
      "<cmd>GoTagAdd yaml<CR>",
      "Add [G]o [S]truct [Y]aml [T]ag",
    },
  },
}

M.rust_tools = {
  plugin = true,
  n = {
    ["<leader>rr"] = { "<cmd>RustRunnables<CR>", "[R]ust [R]unnables" },
    ["<leader>rh"] = { "<cmd>RustHoverActions<CR>", "[R]ust [H]over Actions" },
    ["<leader>rc"] = { "<cmd>RustOpenCargo<CR>", "[R]ust Open [C]argo.toml" },
    ["<leader>rt"] = { "<cmd>lua _G.toggle_inlay_hints()<CR>", "[R]ust [T]oggle Inlay Hints" },
  },
}

-- Alternative code actions mapping to bypass noice issues
M.lsp_alternatives = {
  n = {
    ["<leader>ca"] = {
      function()
        -- Disable noice temporarily for code actions
        local ok, noice = pcall(require, "noice")
        if ok then
          noice.disable()
        end
        
        vim.lsp.buf.code_action()
        
        -- Re-enable noice after a delay
        if ok then
          vim.defer_fn(function()
            noice.enable()
          end, 100)
        end
      end,
      "LSP [C]ode [A]ction (bypass noice)",
    },
    ["<leader>cA"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP [C]ode [A]ction (native)",
    },
    -- Telescope-based diagnostics
    ["<leader>cd"] = {
      function()
        require("telescope.builtin").diagnostics({ bufnr = 0 })
      end,
      "Buffer [D]iagnostics via Telescope",
    },
  },
}

-- more keybinds!

return M
