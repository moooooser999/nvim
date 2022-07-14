
" Basic Setup
set nocompatible
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
set hidden
set mouse+=a
set hlsearch
set path+=**
set t_Co=256
set autoindent
set cindent
set smartindent
set nowrap
"set filetype 
" Display all matchin files when we tab complete
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
"Insertmode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" Set cursorline
set cursorline cursorcolumn
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
"Fold
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML" This setting makes search case-insensitive when all characters in the string

let mapleader=" "
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"tab

set tabstop=4
set softtabstop=4
set shiftwidth=4
"wrap file
au FileType markdown set wrap
au FileType text set wrap
"command
command W w
command Q q
command Wq wq
command WQ wq

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

autocmd FileType json syntax match Comment +\/\/.\+$+

