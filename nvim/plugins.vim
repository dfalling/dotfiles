call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'roryokane/detectindent'
Plug 'jaxbot/semantic-highlight.vim'
" code linting, completion, formatting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" status bar
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
" quickly comment lines
Plug 'scrooloose/nerdcommenter'
" easily change surrounding braces, quotes, tags
Plug 'machakann/vim-sandwich'
" theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" visual find/replace
Plug 'osyo-manga/vim-over'
" show count in gutter for git differences
Plug 'mhinz/vim-signify'
" Highlight matching tag
Plug 'Valloric/MatchTagAlways'
" use tab to complete autocompletions
Plug 'ervandew/supertab'
" case matching find/replace
Plug 'tpope/vim-abolish'
" show number beside tab name
Plug 'mkitt/tabline.vim'
" visual display of leader keys
Plug 'liuchengxu/vim-which-key'
" elixir support
Plug 'elixir-lang/vim-elixir'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
" Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
" javascript support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" yaml
Plug 'stephpy/vim-yaml'
" smooth scrolling
Plug 'psliwka/vim-smoothie'
" indention-based motions
Plug 'jeetsukumaran/vim-indentwise'
" show register previews
Plug 'junegunn/vim-peekaboo'
" for aligning text (eg trailing comments) on multiple lines
Plug 'godlygeek/tabular'
" tree sitter syntax formatting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" telescope searcher
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" file tree
Plug 'preservim/nerdtree'

Plug 'github/copilot.vim'
Plug 'f-person/auto-dark-mode.nvim'
" helpers for working in unix/linux (eg delete, move, rename)
Plug 'tpope/vim-eunuch'
call plug#end()

"Reload .vimrc (:so $MYVIMRC) and :PlugInstall to install plugins.
