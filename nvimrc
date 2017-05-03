call plug#begin('~/.vim/plugged')
" code highlighting
Plug 'scrooloose/syntastic'
" multiple cursors w/ C-n
Plug 'terryma/vim-multiple-cursors'
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" used by airline to show git status
Plug 'tpope/vim-fugitive'
" handlebars syntax support
Plug 'mustache/vim-mustache-handlebars'
" quickly comment lines
Plug 'scrooloose/nerdcommenter'
" easily change surroundings with cs
Plug 'tpope/vim-surround'
" theme
Plug 'joshdick/onedark.vim'
" autocomplete
Plug 'Shougo/deoplete.nvim'
" add ternjs to deoplete
Plug 'carlitux/deoplete-ternjs'
" shows git status in gutter
Plug 'airblade/vim-gitgutter'
" Plug 'godlygeek/tabular'
" netrw tweaks: - to hop to current path
Plug 'tpope/vim-vinegar'
" highlight search replace changes while typing
Plug 'osyo-manga/vim-over'
" color css colors in text
Plug 'ap/vim-css-color'
" silver searcher
Plug 'rking/ag.vim'
" elixir support
Plug 'elixir-lang/vim-elixir'
" elm support
Plug 'lambdatoast/elm.vim'
" fuzyy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" JSON tools
Plug 'tpope/vim-jdaddy'
call plug#end()

"Reload .vimrc (:so $MYVIMRC) and :PlugInstall to install plugins.

filetype plugin indent on

syntax on
colorscheme onedark

set ruler

"Syntastic code hinting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
" disable syntax checking
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['javascript'],'passive_filetypes': [] }
let g:syntastic_javascript_checkers = ['eslint']

" indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" clipboard
set clipboard+=unnamedplus

" backspace
set backspace=indent,eol,start

" Moving swap file from beside the source file
 set swapfile
 set dir=~/.tmp

" fuzzy finder config
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <C-p> :FZF<CR>

" airline
let g:airline_theme='laederon'

" always show status line
set laststatus=2

" hide netrw banner
" let g:netrw_banner=0

" remove delay going to escape http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" needed for nerdcommenter to work
filetype plugin on
let mapleader=","

" changing netrw list style
let g:netrw_liststyle=3

" disable ex mode
nnoremap Q <nop>

" don't wrap in the middle of a word
set linebreak

" leader j, leader k to jump to next/previous line with same indentation
nnoremap <Leader>k :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <Leader>j :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" tab through deoplete options
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" relative line numbers
:set number
:set rnu

function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set nornu
  else
    set rnu
  endif
endfunc

" toggle relative line numbers
nnoremap <C-l> :call NumberToggle()<cr>

" search
:set incsearch
:set hlsearch

" enable jumping between html tags.  requires filetype plugin on which is enabled above
runtime macros/matchit.vim

" disable vim's preview window
set completeopt-=preview

" vim-over helpers
function! VisualFindAndReplace()
  :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
endfunction


nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" highlight current line
:set cursorline

" highlight current column
:set cursorcolumn

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" map space to :
noremap <space> :

" jk for ESC
:imap jk <Esc>

" make the line numbers not invisible (colors at https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg)
:highlight LineNr ctermfg=243

" START better behavior of #o/O
" o/O                   Start insert mode with [count] blank lines.
"                       The default behavior repeats the insertion [count]
"                       times, which is not so useful.
function! s:NewLineInsertExpr( isUndoCount, command )
    if ! v:count
        return a:command
    endif

    let l:reverse = { 'o': 'O', 'O' : 'o' }
    " First insert a temporary '$' marker at the next line (which is necessary
    " to keep the indent from the current line), then insert <count> empty lines
    " in between. Finally, go back to the previously inserted temporary '$' and
    " enter insert mode by substituting this character.
    " Note: <C-\><C-n> prevents a move back into insert mode when triggered via
    " |i_CTRL-O|.
    return (a:isUndoCount && v:count ? "\<C-\>\<C-n>" : '') .
    \   a:command . "$\<Esc>m`" .
    \   v:count . l:reverse[a:command] . "\<Esc>" .
    \   'g``"_s'
endfunction
nnoremap <silent> <expr> o <SID>NewLineInsertExpr(1, 'o')
nnoremap <silent> <expr> O <SID>NewLineInsertExpr(1, 'O')
" END
