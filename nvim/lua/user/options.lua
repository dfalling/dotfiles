-- remap command key to space
vim.api.nvim_set_keymap("n", "<space>", ":", {
    noremap = true
})
vim.api.nvim_set_keymap("n", ":", "<nop>", {
    noremap = true
})

-- remap leader key to comma
vim.g.mapleader = ","

-- kill ex mode
vim.api.nvim_set_keymap('n', 'Q', "<nop>", {
    noremap = true,
    silent = true
})

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- move swap file to temp dir
vim.opt.directory = "~/.tmp"

-- ???
vim.opt.completeopt = {"menuone", "noselect"}

-- line numbers, relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- highlight current line, column
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- match indentation of previous line
vim.opt.smartindent = true

-- clear search highlight
vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR><ESC>", {
    noremap = true
})

-- don't linebreak in the middle of a word
vim.opt.linebreak = true

-- put swap, backup, undo files in nvim config dir
local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")
vim.opt.undodir = {prefix .. "/nvim/.undo//"}
vim.opt.backupdir = {prefix .. "/nvim/.backup//"}
vim.opt.directory = {prefix .. "/nvim/.swp//"}
