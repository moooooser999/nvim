"
so ~/.vim/vim/basic.vim
	"Load plugin
so ~/.vim/vim/plugin.vim


"

colorscheme nord
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
require('plugins-config.auto-dark-mode')
--require('lsp.setup')
--require('lsp.nvim-cmp')
--require('lsp.ui')
EOF


"so ~/.config/nvim/lua/lsp/lspsaga.rc.vim



