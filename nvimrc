call plug#begin('~/.vim/plugged')
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'sjl/gundo.vim'
Plug 'roryokane/detectindent'
" reason
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" code linting
Plug 'w0rp/ale'
" status bar
Plug 'vim-airline/vim-airline'
" git plugin
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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
" shows git status in gutter
Plug 'airblade/vim-gitgutter'
" netrw tweaks: - to hop to current path
Plug 'tpope/vim-vinegar'
" highlight search replace changes while typing
Plug 'osyo-manga/vim-over'
" color css colors in text
Plug 'ap/vim-css-color'
" show count in gutter for git differences
Plug 'mhinz/vim-signify'
" elixir support
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
" elm support
Plug 'lambdatoast/elm.vim'
" javascript support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" typescript support
Plug 'leafgarland/typescript-vim'
" Highlight matching tag
Plug 'Valloric/MatchTagAlways'
" JSON tools
Plug 'tpope/vim-jdaddy'
" fuzyy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

"Reload .vimrc (:so $MYVIMRC) and :PlugInstall to install plugins.


" INDENTATION ============================================

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" auto-detect indentation on file open
augroup DetectIndent
  autocmd!
  autocmd BufReadPost *  DetectIndent
augroup END


" STYLE ==================================================

if (has("termguicolors"))
 set termguicolors
endif

syntax on
colorscheme onedark

" highlight current line
:set cursorline
:hi CursorLine guibg=#444444 gui=bold

" highlight current column
:set cursorcolumn
:hi CursorColumn guibg=#444444 gui=bold

" make the line numbers not invisible
:highlight LineNr guifg=#707070

" different selection color
:hi Visual  guibg=#444444 gui=none

" disable background color
highlight Normal guibg=none
highlight NonText guibg=none


" KEY REMAPPINGS =========================================

" map space to :
noremap <space> :
" disable : 
noremap : <NOP>

" jk for ESC
:imap jk <Esc>

" make alternative buffer more accessible
noremap <Leader>z <C-^>

" Gundo
nnoremap <F5> :GundoToggle<CR>

let mapleader=","

" changing netrw list style
" let g:netrw_liststyle=3

" disable ex mode
nnoremap Q <nop>


" ALE (code linting) =====================================

let g:airline#extensions#ale#enabled = 1
" show fix list on errors
let g:ale_open_list = 1
" lint on save/open only
" let g:ale_lint_on_text_changed = 'never'

nmap <Leader>p <Plug>(ale_fix)

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" FEATURES ===============================================

set ruler

" enable mouse
set mouse=a

" enable system clipboard
set clipboard+=unnamedplus

" backspace
set backspace=indent,eol,start

" Moving swap file from beside the source file
 set swapfile
 set dir=~/.tmp

" needed for nerdcommenter to work
filetype plugin on

" don't wrap in the middle of a word
set linebreak

" disable vim's preview window
set completeopt-=preview


" SEARCH =================================================

:set incsearch
:set hlsearch

" fuzzy finder config
nnoremap <C-p> :FZF<CR>

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

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

" leader j, leader k to jump to next/previous line with same indentation
nnoremap <Leader>k :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <Leader>j :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>


" LINE NUMBERS ===========================================

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


" WHITE SPACE ============================================

" toggle whitespace
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
function! WhitespaceToggle()
  :set list!
endfunction

nnoremap <C-;> :call WhitespaceToggle()<cr>


" NERD COMMENTER =========================================

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" MATCH TAG ALWAYS =======================================

let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'javascript.jsx': 1 }


" DEOPLETE ===============================================

let g:deoplete#enable_at_startup = 1

" tab through deoplete options
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" BETTER o/O BEHAVIOR ====================================

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


" LANGUAGE CLIENT ========================================


let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
