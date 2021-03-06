call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'roryokane/detectindent'
Plug 'jaxbot/semantic-highlight.vim'
" code linting, completion, formatting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" status bar
Plug 'itchyny/lightline.vim'
" quickly comment lines
Plug 'scrooloose/nerdcommenter'
" easily change surrounding braces, quotes, tags
Plug 'machakann/vim-sandwich'
" theme
Plug 'rakr/vim-one'
" visual find/replace
Plug 'osyo-manga/vim-over'
" show count in gutter for git differences
Plug 'mhinz/vim-signify'
" Highlight matching tag
Plug 'Valloric/MatchTagAlways'
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" use tab to complete autocompletions
Plug 'ervandew/supertab'
" case matching find/replace
Plug 'tpope/vim-abolish'
" show number beside tab name
Plug 'mkitt/tabline.vim'
" visual display of leader keys
Plug 'liuchengxu/vim-which-key'
" reason support
Plug 'reasonml-editor/vim-reason-plus'
Plug 'rescript-lang/vim-rescript'
" elixir support
Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
" javascript support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" typescript support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" yaml
Plug 'stephpy/vim-yaml'
" ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
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
call plug#end()

"Reload .vimrc (:so $MYVIMRC) and :PlugInstall to install plugins.
