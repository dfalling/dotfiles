-- function to duplicate current vim window
function DuplicateWindow()
	vim.cmd("sp")
	vim.cmd("wincmd T")
end

-- function to copy git-relative path to clipboard
function CopyGitRelativePath()
	local file_path = vim.fn.expand("%:p")
	local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel")[1]
	if git_root and vim.v.shell_error == 0 then
		local relative_path = file_path:sub(#git_root + 2)
		vim.fn.setreg("+", relative_path)
		print("Copied: " .. relative_path)
	else
		print("Not in a git repository")
	end
end

-- function to properly reload config by clearing Lua module cache
function ReloadConfig()
	-- Clear all user.* modules from cache (except plugins to avoid lazy.nvim re-init)
	for name, _ in pairs(package.loaded) do
		if name:match("^user") and name ~= "user.plugins" then
			package.loaded[name] = nil
		end
	end

	-- Find and reload all user modules based on init.lua order
	local user_path = vim.fn.stdpath("config") .. "/lua/user"
	local init_content = vim.fn.readfile(vim.fn.stdpath("config") .. "/init.lua")

	for _, line in ipairs(init_content) do
		local module = line:match('require%s+"(user%.%w+)"')
		if module and module ~= "user.plugins" then
			require(module)
		end
	end

	print("Config reloaded!")
end

vim.cmd([[
    " o/O                   Start insert mode with [count] blank lines.
    "                       The default behavior repeats the insertion [count]
    "                       times, which is not so useful.
    function! s:NewLineInsertExpr( isUndoCount, command )
        if ! v:count
            return a:command
        endif

        let l:reverse = { 'o': 'O', 'O' : 'o' }
        " First insert a temporary '$' marker at the next line (which is necessary
        " to keep the indent from the current line), then insert <count> empty lines
        " in between. Finally, go back to the previously inserted temporary '$' and
        " enter insert mode by substituting this character.
        " Note: <C-\><C-n> prevents a move back into insert mode when triggered via
        " |i_CTRL-O|.
        return (a:isUndoCount && v:count ? "\<C-\>\<C-n>" : '') .
        \   a:command . "$\<Esc>m`" .
        \   v:count . l:reverse[a:command] . "\<Esc>" .
        \   'g``"_s'
    endfunction
    nnoremap <silent> <expr> o <SID>NewLineInsertExpr(1, 'o')
    nnoremap <silent> <expr> O <SID>NewLineInsertExpr(1, 'O')
]])

vim.cmd([[
	:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
	function! WhitespaceToggle()
	  :set list!
	endfunction
]])
