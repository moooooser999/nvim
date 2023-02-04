"Plugin
call plug#begin('~/.vim/plugged')   
Plug 'renerocksai/calendar-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'f-person/auto-dark-mode.nvim'
Plug 'junegunn/vim-easy-align'
" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'wookayin/vim-typora'
Plug 'chrisbra/csv.vim'
Plug 'honza/vim-snippets'
Plug 'Jorengarenar/vim-syntaxMarkerFold'
Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
" If you are using Vim Plug
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'jiangmiao/auto-pairs'
Plug 'zenbro/mirror.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'lyokha/vim-xkbswitch'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'tpope/vim-repeat'
call plug#end()
