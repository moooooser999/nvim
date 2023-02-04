"
so ~/.vim/vim/basic.vim
	"Load plugin
so ~/.vim/vim/plugin.vim



"

let g:livepreview_previewer = 'skim'
let g:livepreview_engine = 'pdflatex'
colorscheme onenord
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
require('plugins-config.lualine')
require('plugins-config.indent-blankline')
require('plugins-config.auto-dark-mode')
require('plugins-config.lsp')
require('plugins-config.copilot')
require('plugins-config.trouble')
require('plugins-config.git-signs')
EOF


"so ~/.config/nvim/lua/lsp/lspsaga.rc.vim



