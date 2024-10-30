return {

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "clang-format",
        -- "html-lsp",
        -- "css-lsp",
        -- "prettier",
        -- "prettierd",
        "gopls",
        "gofumpt",
        "goimports",
        "gomodifytags",
        "goimports-reviser",
        "golines",
        "sqls",
        -- "ccls",
        "clangd",
        -- "tailwindcss",
        -- "typescript-language-server",
        -- "tailwindcss-language-server",
        "svelte-language-server",
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
        "svelte",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
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
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   opts = {
  --     -- Attach to buffer
  --     require("colorizer").attach_to_buffer(0, { mode = "background", css = true }),
  --   },
  -- },
{
  "NvChad/nvim-colorizer.lua",
  opts = {
    -- Default options can be set here if needed
  },
  config = function()
    require("colorizer").setup() -- Initialize the colorizer
    -- Attach colorizer to current buffer
    require("colorizer").attach_to_buffer(0, { mode = "background", css = true })
  end,
},
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   flavour = "mocha",
  --   background = {
  --     dark = "mocha",
  --     light = "latte",
  --   },
  -- },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   init = function()
  --     require("core.utils").load_mappings("dap")
  --   end
  -- },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      ---Render style
      ---@usage 'background'|'foreground'|'virtual'
      render = "background",

      ---Set virtual symbol (requires render to be set to 'virtual')
      virtual_symbol = "■",

      ---Highlight named colors, e.g. 'green'
      enable_named_colors = true,

      ---Highlight tailwind colors, e.g. 'bg-blue-500'
      enable_tailwind = true,

      ---Set custom colors
      ---Label must be properly escaped with '%' to adhere to `string.gmatch`
      --- :help string.gmatch
      custom_colors = {
        { label = "%-%-theme%-primary%-color", color = "#0f1219" },
        { label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins
  --
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },
  {
    "numToStr/Comment.nvim",
    opts = function()
      require("Comment").setup {
        pre_hook = function(ctx)
          local U = require "Comment.utils"

          -- Determine the location where the commentstring is needed
          local location = nil
          if ctx.ctype == U.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
          end

          -- Use the calculated commentstring
          return require("ts_context_commentstring.internal").calculate_commentstring {
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
          }
        end,
      }
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    -- (optional) will update plugin's deps on every update
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    opts = {},
  },
}
