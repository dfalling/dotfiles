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
Plug 'tpope/vim-vinegar'
" highlight search replace changes while typing
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
" many others...
Plug 'sheerun/vim-polyglot'
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
set cursorline
hi CursorLine guibg=#444444 gui=bold

" highlight current column
set cursorcolumn
hi CursorColumn guibg=#444444 gui=bold

" make the line numbers not invisible
highlight LineNr guifg=#707070

" make comment text not invisible
highlight Comment guifg=#8899BB

" different selection color
highlight Visual  guibg=#444444 gui=none

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

let mapleader=","

" disable ex mode
nnoremap Q <nop>


" COC CONFIG =============================================

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" use vertical split instead of horizontal for diffs
set diffopt+=vertical

" SEARCH =================================================

:set incsearch
:set hlsearch
" escape to unhighlight searches
noremap <ESC> :noh<CR><ESC>

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


" BUFFERS ================================================

" make alternative buffer more accessible
noremap <Leader>z <C-^>

" Show fzf buffers after leader-b
nnoremap <Leader>b :Buffers<CR>

" Need to figure this one out: closes all other buffers
" nnoremap <Leader>d :%bd|e#<CR>


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
nnoremap <Leader>l :call NumberToggle()<cr>


" WHITE SPACE ============================================

" toggle whitespace
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
function! WhitespaceToggle()
  :set list!
endfunction

nnoremap <Leader>; :call WhitespaceToggle()<cr>


" NERD COMMENTER =========================================

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" MATCH TAG ALWAYS =======================================

let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'javascript.jsx': 1 }


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


" COPY WINDOW SHORTCUT ===================================


function! DuplicateWindow()
  :sp
  :wincmd T
endfunction

nnoremap <Leader>d :call DuplicateWindow()<cr>
