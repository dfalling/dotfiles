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
