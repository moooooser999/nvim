"
so ~/.vim/vim/basic.vim
"Load plugin
so ~/.vim/vim/plugin.vim


"

"Load Lua Plugins and config
lua<<EOF
require('keybindings')
require('plugins')
require('plugins-config.nvim-treesitter')
require('plugins-config.bufferline')
require('plugins-config.alpha')
require('plugins-config.telescope')
require('plugins-config.toggleterm')
require('plugins-config.snippets')
require('plugins-config.telekasten')
require('plugins-config.lualine')
require('plugins-config.indent-blankline')
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
--require('lsp.setup')
--require('lsp.nvim-cmp')
--require('lsp.ui')
EOF


"so ~/.config/nvim/lua/lsp/lspsaga.rc.vim



