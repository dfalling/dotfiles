call which_key#register(',', "g:which_key_map")
let g:mapleader = ","
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>

set timeoutlen=500

let g:which_key_map =  {}

let g:which_key_map.b = {
      \ 'name' : '+buffer'  ,
      \ 'd' : ['bd'         , 'delete-buffer']   ,
      \ 'f' : ['bfirst'     , 'first-buffer']    ,
      \ 'l' : ['blast'      , 'last-buffer']     ,
      \ 'n' : ['bnext'      , 'next-buffer']     ,
      \ 'p' : ['bprevious'  , 'previous-buffer'] ,
      \ 'x' : [':%bd|e#'    , 'close-all']       ,
      \ '?' : ['Buffers'    , 'fzf-buffer']      ,
      \ }

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ 'x' : [':only'      , 'close-other-windows']   ,
      \ }


let g:which_key_map.s = {
      \ 'name' : '+session' ,
      \ 'w' : [':mksession! ~/.vim.session'        , 'write']  ,
      \ 'r' : [':source ~/.vim.session'        , 'read']       ,
      \ }


let g:which_key_map.t = {
      \ 'name' : '+tabs' ,
      \ 'n' : [':tabnew'                      , 'new']        ,
      \ 'd' : [':call DuplicateWindow()<cr>'  , 'duplicate']  ,
      \ 'r' : [':.+1,$tabdo :tabc'            , 'close-tabs-to-the-right']  ,
      \ 'o' : [':tabo'                        , 'close-other-tabs']  ,
      \ }


let g:which_key_map.x = {
      \ 'name' : '+colors' ,
      \ 'l' : [':set background=light'        , 'light']  ,
      \ 'd' : [':set background=dark'         , 'dark']   ,
      \ }
