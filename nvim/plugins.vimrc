call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'roryokane/detectindent'
Plug 'jaxbot/semantic-highlight.vim'
" code linting, completion, formatting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" status bar
Plug 'vim-airline/vim-airline'
" git plugin
" I haven't really been using fugitive at all, disabling to see if I miss
" it...
" Plug 'tpope/vim-fugitive'
" quickly comment lines
Plug 'scrooloose/nerdcommenter'
" easily change surroundings with cs
Plug 'tpope/vim-surround'
" theme
Plug 'joshdick/onedark.vim'
" netrw tweaks: - to hop to current path
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
" yesssssss
Plug 'liuchengxu/vim-which-key'
" reason support
Plug 'reasonml-editor/vim-reason-plus'
" elixir support
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
" javascript support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" typescript support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" yaml
Plug 'stephpy/vim-yaml'
" many other syntaxes
Plug 'sheerun/vim-polyglot'
" ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
call plug#end()

"Reload .vimrc (:so $MYVIMRC) and :PlugInstall to install plugins.
