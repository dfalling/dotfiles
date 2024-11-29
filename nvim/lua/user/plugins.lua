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
    opts = {},
    keys = {
      { "<leader>a", group = "files" },
      { "<leader>ac", ':let @+ = expand("%")<CR>', desc = "copy path" },
      { "<leader>ax", ":NvimTreeFindFile<CR>", desc = "explore" },
      { "<leader>ad", ":call delete(expand('%')) | bdelete!", desc = "delete" },
      { "<leader>f", group = "find" },
      { "<leader>fa", "<Cmd>lua require('telescope.builtin').oldfiles()<CR>", desc = "recent files" },
      { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "buffers" },
      { "<leader>fc", group = "commands" },
      { "<leader>fcc", "<Cmd>Telescope commands<CR>", desc = "commands" },
      { "<leader>fch", "<Cmd>Telescope command_history<CR>", desc = "history" },
      { "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", desc = "files" },
      { "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "file contents" },
      { "<leader>fl", ":Telescope live_grep find_command=rg,--ignore,--hidden,--fixed-strings,--files<CR>", desc = "file contents (literal)" },
      { "<leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "help tags" },
      { "<leader>fq", "<Cmd>Telescope quickfix<CR>", desc = "quickfix" },
      { "<leader>fs", "<Cmd>Telescope search_history<CR>", desc = "search history" },
      { "<leader>ft", "<Cmd>lua require('telescope.builtin').resume()<CR>", desc = "resume search" },
      { "<leader>s", group = "whitespace" },
      { "<leader>st", "<Cmd>call WhitespaceToggle()<CR>", desc = "toggle" },
      { "<leader>t", group = "tab" },
      { "<leader>td", "<Cmd>lua DuplicateWindow()<CR>", desc = "duplicate" },
      { "<leader>w", ":w!<CR>", desc = "save file" },
      { "<leader>x", group = "vim" },
      { "<leader>xc", ":checkhealth<CR>", desc = "check health" },
      { "<leader>xr", ":source $MYVIMRC<CR>", desc = "reload config" },
    },
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
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
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
        elixirls = {enable = false}
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- show lint warnings
  { 'mfussenegger/nvim-lint' },

  { 'nanotee/zoxide.vim' },

  -- typescript config
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  -- file browser
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
})
