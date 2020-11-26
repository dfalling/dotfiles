call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'roryokane/detectindent'
Plug 'jaxbot/semantic-highlight.vim'
" code linting, completion, formatting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" status bar
Plug 'vim-airline/vim-airline'
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
" many other syntaxes
" polyglot wants settings defined before loading
source ~/.cfg/nvim/polyglot.vim
Plug 'sheerun/vim-polyglot'
" ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" smooth scrolling
Plug 'psliwka/vim-smoothie'
" indention-based motions
Plug 'jeetsukumaran/vim-indentwise'
" show register previews
Plug 'junegunn/vim-peekaboo'
" tab bar
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

"Reload .vimrc (:so $MYVIMRC) and :PlugInstall to install plugins.
