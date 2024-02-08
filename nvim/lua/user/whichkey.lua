local wk = require('whichkey_setup')

local keymap = {

	w = { ':w!<CR>', 'save file' }, -- set a single command and text
	f = {                     -- set a nested structure
		name = '+find',
		b = { '<Cmd>Telescope buffers<CR>', 'buffers' },
		f = { '<Cmd>Telescope find_files<CR>', 'files' },
		g = { '<Cmd>Telescope live_grep<CR>', 'file contents' },
		h = { '<Cmd>Telescope help_tags<CR>', 'help tags' },
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
	["-"] = { ':Neotree<CR>', 'File sidebar' }
}

wk.register_keymap('leader', keymap)
