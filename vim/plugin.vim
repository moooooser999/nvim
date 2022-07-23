"Plugin
call plug#begin('~/.vim/plugged')   
Plug 'renerocksai/calendar-vim'
Plug 'renerocksai/telekasten.nvim',{ 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'f-person/auto-dark-mode.nvim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'konfekt/fastfold'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'plasticboy/vim-markdown'
Plug 'chrisbra/csv.vim'
Plug 'honza/vim-snippets'
Plug 'Jorengarenar/vim-syntaxMarkerFold'
Plug 'lervag/vimtex'
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
" If you are using Vim Plug
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'jiangmiao/auto-pairs'
Plug 'zenbro/mirror.vim'
call plug#end()



























