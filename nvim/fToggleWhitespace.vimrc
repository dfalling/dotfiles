:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
function! WhitespaceToggle()
  :set list!
endfunction

nnoremap <Leader>; :call WhitespaceToggle()<cr>
