require('auto-dark-mode').setup {
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme gruvbox')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme onenord')
	end,
	}
require('auto-dark-mode').init()
