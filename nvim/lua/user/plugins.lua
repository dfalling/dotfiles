-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("lazy").setup({
  -- An implementation of the Popup API from vim in Neovim
  { "nvim-lua/popup.nvim" },

  -- Vim motions on speed
  { "easymotion/vim-easymotion" },

  -- toggle line comments
  { "scrooloose/nerdcommenter" },

  -- easily change surrounding braces, quotes, tags
  { "machakann/vim-sandwich" },

  -- theme
  { "catppuccin/nvim" },

  -- smooth scrolling
  { "psliwka/vim-smoothie" },

  -- show register contents
  { "junegunn/vim-peekaboo" },

  -- github copilot
  { "github/copilot.vim" },

  -- auto dark mode
  { "f-person/auto-dark-mode.nvim" },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter" },

  -- visual display of leader keys
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  -- statusline
  { "hoob3rt/lualine.nvim" },

  -- language server
  { "neovim/nvim-lspconfig" },

  -- format on save
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>ww",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        elixir = { "mix" },
        javascript = { "biome" },
        typescript = { "biome" },
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
  },

  -- visual search and replace
  { "osyo-manga/vim-over" },

  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- indentation based movements: move to different / same indention levels
  { "jeetsukumaran/vim-indentwise" },

  -- detect indent settings. without this new lines have seemingly random indentation
  { "roryokane/detectindent" },

  -- elixir syntax highlighting
  { "elixir-lang/vim-elixir" },

  -- elixir next language server
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        nextls = {enable = true},
        credo = {enable = false},
        elixirls = {enable = false,}
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- show lint warnings
  { 'mfussenegger/nvim-lint' },
})
