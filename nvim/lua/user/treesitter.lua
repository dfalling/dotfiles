require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the four listed parsers should always be installed)
    ensure_installed = {"c", "lua", "vim", "vimdoc"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {"javascript"},

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = {"c", "rust"},
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    }
}

-- ensure parser installed for current file
-- https://dpaste.org/rGFLg/slim
-- ​- returns a single input char 
function get_char_input()
    return vim.fn.nr2char(vim.fn.getchar())
end

-- ​- clears the command prompt 
function clear_prompt()
    vim.api.nvim_command('​normal! :​')
end

local ask_install = {}

function EnsureTSParserInstalled()
    local parsers = require 'nvim-treesitter.parsers'
    local lang = parsers.get_buf_lang()

    if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) and ask_install[lang] ~= false then
        vim.schedule_wrap(function()

            local is_confirmed = false
            -- TODO: implement a Y/n prompt util func
            print('Install treesitter parser for ' .. lang .. ' ? Y/n')
            local res = get_char_input()
            if res:match('\r') then
                is_confirmed = true
            end
            if res:match('y') then
                is_confirmed = true
            end
            if res:match('Y') then
                is_confirmed = true
            end
            clear_prompt()

            if (is_confirmed) then
                vim.cmd('TSInstall ' .. lang)
            else
                ask_install[lang] = false
            end
        end)()
    end
end

vim.cmd [[au FileType * :lua EnsureTSParserInstalled()]]
