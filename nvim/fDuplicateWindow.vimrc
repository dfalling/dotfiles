function! DuplicateWindow()
  :sp
  :wincmd T
endfunction

nnoremap <Leader>d :call DuplicateWindow()<cr>
