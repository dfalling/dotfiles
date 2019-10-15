source ~/.cfg/nvim/plugins.vimrc
source ~/.cfg/nvim/styling.vimrc
source ~/.cfg/nvim/coc.vimrc
source ~/.cfg/nvim/search.vimrc
source ~/.cfg/nvim/indentation.vimrc

" functions
source ~/.cfg/nvim/fNumberToggle.vimrc
source ~/.cfg/nvim/fNewLines.vimrc
source ~/.cfg/nvim/fDuplicateWindow.vimrc
source ~/.cfg/nvim/fToggleWhitespace.vimrc


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

" Show fzf buffers after leader-b
nnoremap <Leader>b :Buffers<CR>


" PLUGINS

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" match tag always
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'javascript.jsx': 1 }
