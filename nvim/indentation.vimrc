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
