vim.cmd([[
augroup DetectIndent
	 autocmd!
	 autocmd BufReadPost *  DetectIndent
augroup END
]])
