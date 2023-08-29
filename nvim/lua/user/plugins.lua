local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "easymotion/vim-easymotion" -- Vim motions on speed
    use "scrooloose/nerdcommenter" -- Vim plugin for intensely orgasmic commenting
    use "machakann/vim-sandwich" -- easily change surrounding braces, quotes, tags
    use "catppuccin/nvim" -- theme
    use "psliwka/vim-smoothie" -- smooth scrolling
    use "junegunn/vim-peekaboo" -- show register contents
    use "github/copilot.vim" -- github copilot
    use "f-person/auto-dark-mode.nvim" -- auto dark mode
    use "nvim-treesitter/nvim-treesitter" -- treesitter
    use {
        'AckslD/nvim-whichkey-setup.lua',
        requires = {'liuchengxu/vim-which-key'}
    } -- visual display of leader keys
    use "hoob3rt/lualine.nvim" -- statusline
    use {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig"} -- language server + installer
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = {{'nvim-lua/plenary.nvim'}}
    } -- fuzzy finder
    use "jeetsukumaran/vim-indentwise" -- indentation based movements: move to different / same indention levels
    use "roryokane/detectindent" -- detect indent settings. without this new lines have seemingly random indentation

    use "elixir-lang/vim-elixir" -- elixir syntax highlighting

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
