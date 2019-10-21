source ~/.cfg/nvim/plugins.vim
source ~/.cfg/nvim/whichKey.vim
source ~/.cfg/nvim/styling.vim
source ~/.cfg/nvim/coc.vim
source ~/.cfg/nvim/search.vim
source ~/.cfg/nvim/indentation.vim
source ~/.cfg/nvim/ranger.vim

" functions
source ~/.cfg/nvim/fNumberToggle.vim
source ~/.cfg/nvim/fNewLines.vim
source ~/.cfg/nvim/fDuplicateWindow.vim
source ~/.cfg/nvim/fToggleWhitespace.vim


" map space to :
noremap <space> :

" disable :
noremap : <NOP>

let mapleader=","

" disable ex mode
nnoremap Q <nop>

" enable mouse
" set mouse=a

" enable system clipboard
set clipboard+=unnamedplus

" backspace https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start

" Moving swap file from beside the source file
 set swapfile
 set dir=~/.tmp

" don't wrap in the middle of a word
set linebreak

" disable vim's preview window
set completeopt-=preview

" relative line numbers
:set number
:set rnu


" PLUGINS

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" match tag always
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'javascript.jsx': 1 }
