local wk = require("which-key")

wk.register({
	w = { ':w!<CR>', 'save file' }, -- set a single command and text
	f = {                     -- set a nested structure
		name = '+find',
		b = { '<Cmd>Telescope buffers<CR>', 'buffers' },
		f = { "<Cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", 'files',  },
		g = { '<Cmd>Telescope live_grep<CR>', 'file contents' },
		h = { '<Cmd>Telescope help_tags<CR>', 'help tags' },
    r = { "<Cmd>lua require('telescope.builtin').resume()<CR>", 'resume search' },
		c = {
			name = '+commands',
			c = { '<Cmd>Telescope commands<CR>', 'commands' },
			h = { '<Cmd>Telescope command_history<CR>', 'history' }
		},
		q = { '<Cmd>Telescope quickfix<CR>', 'quickfix' }
	},
	t = {
		name = '+tab',
		d = { '<Cmd>lua DuplicateWindow()<CR>', 'duplicate' }
	},
	s = {
		name = '+whitespace',
		t = { '<Cmd>call WhitespaceToggle()<CR>', 'toggle' }
	},
  x = { ':NvimTreeFindFile<CR>', 'explore'},
  a = {
    name = '+files',
    c = { ':let @+ = expand("%")<CR>', 'copy' },
  },
}, { prefix = "<leader>" })
