local Meta = {
	terminal_types = {
	  powershell = 'powershell',
		cmd = 'cmd',
		bash = 'bash',
		fish = 'fish',
	}
}

Meta.config = {
	defualt_shell = Meta.terminal_types.fish,
	lang = {
		 -- js = require('suhan.lang.js')
	}
}

return Meta

