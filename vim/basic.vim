

" Basic Setup
set nocompatible
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set ignorecase
set smartcase
set nohlsearch
set incsearch
set hidden
set mouse+=a
set path+=**
set t_Co=256
set cindent
set smartindent
set nowrap
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
"set filetype 
" Display all matchin files when we tab complete
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
"Insertmode
"let &t_SI = "\e[6 q" 
"let &t_EI = "\e[2 q"
" Set cursorline
set cursorline 
set cursorcolumn
nnoremap <Leader>cl :set cursorline! cursorcolumn!<CR>
"Fold
set foldmethod=syntax
set foldlevelstart=1
set pumblend=0
set winblend=0

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML" This setting makes search case-insensitive when all characters in the string

let mapleader=" "

"tab

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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

set autochdir
autocmd FileType json syntax match Comment +\/\/.\+$+

" Autoindent
inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction
filetype on
filetype plugin on
filetype indent on

