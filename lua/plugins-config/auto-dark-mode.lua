require('auto-dark-mode').setup {
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme gruvbox')
        --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
	set_light_mode = function()
		require('plugins-config.onenord')
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme onenord')
        --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
	}
require('auto-dark-mode').init()
