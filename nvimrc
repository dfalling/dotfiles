call plug#begin('~/.vim/plugged')
" code linting
Plug 'w0rp/ale'
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
" elixir support
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
" elm support
Plug 'lambdatoast/elm.vim'
" React support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Valloric/MatchTagAlways'
Plug 'alvan/vim-closetag'
" fuzyy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" JSON tools
Plug 'tpope/vim-jdaddy'
" neoformat
Plug 'sbdchd/neoformat'
call plug#end()

"Reload .vimrc (:so $MYVIMRC) and :PlugInstall to install plugins.

filetype plugin indent on

if (has("termguicolors"))
 set termguicolors
endif

" ale (linting) config
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1

syntax on
colorscheme onedark

set ruler

" indentation
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" enable mouse
set mouse=a

" clipboard
set clipboard+=unnamedplus

" backspace
set backspace=indent,eol,start

" Moving swap file from beside the source file
 set swapfile
 set dir=~/.tmp

" fuzzy finder config
nnoremap <C-p> :Gfp<CR>

" add Rg ripgrep command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Gfp shortcut to show gitfiles with preview
command! -bang -nargs=* Gfp call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))

" Ag command to show silver searcher omitting file names from search
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" remove delay going to escape http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" needed for nerdcommenter to work
filetype plugin on
let mapleader=","

" changing netrw list style
" let g:netrw_liststyle=3

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

" visual search
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" toggle whitespace
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
function! WhitespaceToggle()
  :set list!
endfunction

nnoremap <C-k> :call WhitespaceToggle()<cr>

" make alternative buffer more accessible
noremap <Leader>, <C-^>
" highlight current line
:set cursorline
:hi CursorLine guibg=#444444 gui=bold

" highlight current column
:set cursorcolumn
:hi CursorColumn guibg=#444444 gui=bold

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" MatchTagAlways options
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'javascript.jsx': 1 }

" closetag options
let g:closetag_filenames = '*.html,*.jsx,*.hbs'

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
