"
so ~/.config/nvim/vim/basic.vim
set termguicolors
lua<<EOF
require('plugins')
require('plugins-config.alpha')
require('plugins-config.nvim-treesitter')
require('plugins-config.bufferline')
require('plugins-config.telescope')
require('plugins-config.toggleterm')
require('plugins-config.snippets')
require('plugins-config.lualine')
require('plugins-config.indent-blankline')
require('plugins-config.lsp')
require('plugins-config.copilot')
require('plugins-config.trouble')
require('plugins-config.git-signs')
require('plugins-config.null_ls')
require('plugins-config.nvim-tree')
-- require('plugins-config.auto-dark-mode')
require('plugins-config.lspsaga')
require('plugins-config.nvim-treesitter-text-object')
require('plugins-config.copilot-chat')
require('keybindings')
EOF
"
let g:livepreview_previewer = 'skim'
let g:livepreview_engine = 'pdflatex'
colorscheme gruvbox
autocmd VimEnter,BufEnter * if &ft == 'alpha' | set showtabline=0 | set laststatus=0 | else | set showtabline=2 | set laststatus=2 | endif
" set background to transparent
highlight Normal guibg=NONE ctermbg=NONE
