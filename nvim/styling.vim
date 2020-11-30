if (has("termguicolors"))
 set termguicolors
endif

syntax on
colorscheme one

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
