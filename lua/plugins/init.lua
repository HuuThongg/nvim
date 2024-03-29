return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    -- opts = {
    --   servers = {
    --     tailwindcss = {}
    --   }
    -- }
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "prettierd",
        "gopls",
        "gofumpt",
        "goimports",
        "gomodifytags",
        "goimports-reviser",
        "golines",
        "sqls",
        "tailwindcss",
        "typescript-language-server",
        "tailwindcss-language-server",
      },
    },
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "rust",
        "slang",
      },
    },
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  -- },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    opts = {
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "html", "xml", "tsx" },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {
        css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
        javascript = { rgb_fn = true }, -- Enable parsing rgb(...) functions in javascript.
        html = { names = true }, -- Enable parsing color names in html.
      }
    end,
    opts = {
      user_default_options = {
        tailwind = true,
      }
    }
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
}
