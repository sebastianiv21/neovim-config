local M = {}
local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too

local screen_w = vim.opt.columns:get()
local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
local window_w = screen_w * WIDTH_RATIO
local window_h = screen_h * HEIGHT_RATIO
local window_w_int = math.floor(window_w)
local window_h_int = math.floor(window_h)
local center_x = (screen_w - window_w) / 2
local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "json",
    "java",
    "yaml",
    "http",
    "sql",
    "c_sharp",
    "cpp",
    "rust",
    "toml",
    "go",
    "python",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "deno",
    "eslint_d",
    "prettier",
    "jq",

    -- go stuff
    "gopls",
    "golines",
    "goimports",
    "delve", -- Go debugger

    -- rust stuff
    "rust-analyzer",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "codelldb", -- C/C++/Rust debugger

    -- c# stuff
    "csharp-language-server",
    "netcoredbg", -- C# debugger

    -- python stuff
    "mypy",
    "ruff",
    "pyright",
    "black",
    "debugpy", -- Python debugger

    -- java stuff
    "jdtls", -- Java LSP

    -- debug adapters
    "js-debug-adapter", -- JavaScript/TypeScript/Node.js debugger
    "node-debug2-adapter", -- Legacy Node.js debugger (backup)
    "chrome-debug-adapter", -- Chrome debugger for web apps
    "firefox-debug-adapter", -- Firefox debugger for web apps
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  view = {
    side = "right",
    float = {
      enable = true,
      open_win_config = {
        border = "rounded",
        relative = "editor",
        row = center_y,
        col = center_x,
        width = window_w_int,
        height = window_h_int,
      },
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },

      glyphs = {
        folder = {
          default = "",
        },
      },
    },
  },
}

-- nvterm
M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        border = "rounded",
        relative = "editor",
        row = 0.075,
        col = 0.1,
        width = 0.8,
        height = 0.8,
      },
    },
  },
}

return M
