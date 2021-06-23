:set incsearch
:set hlsearch

" escape to unhighlight searches
noremap <ESC> :noh<CR><ESC>

" fuzzy finder config
nnoremap <C-p> :Telescope find_files theme=get_ivy<CR>

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

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" remove delay going to escape http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files theme=get_ivy find_command=rg,--ignore,--hidden,--files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep theme=get_ivy<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
