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



"Nvimree
map <C-n> :NvimTreeToggle<CR>

"ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif


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


" MarkdownPreview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'safari'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

let g:mkdp_theme='dark'

"Telekestan
"
"
"

" ----- the following are for syntax-coloring [[links]] and ==highlighted text==
" ----- (see the section about coloring in README.md)

" for gruvbox
hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
hi tkBrackets ctermfg=gray guifg=gray

" real yellow
hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold
" gruvbox
"hi tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold

hi link CalNavi CalRuler
hi tkTagSep ctermfg=gray guifg=gray
hi tkTag ctermfg=175 guifg=#d3869B


"CoC Config

" GoTo code navigation.
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gr :Telescope coc references<CR>
nmap rr <Plug>(coc-refactor)
nmap g[ <Plug>(coc-diagnostic-prev)
nmap g] <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

function! s:check_back_space() abort
	  let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
	endfunction

inoremap <silent><expr> <Tab>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<Tab>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
  else
	call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>f  <Plug>(coc-format-selected)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" File map
let g:coc_filetype_map = {
      \ 'telekasten': 'markdown',
      \ }


"Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"CSV
let b:csv_arrange_align = 'l*'
aug CSV_Editing
		au!
		au BufRead,BufWritePost *.csv :%ArrangeColumn
		au BufWritePre *.csv :%UnArrangeColumn
aug end

"FastFold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

"Fold Strategy
let g:markdown_folding = 1
let g:rst_fold_enabled = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:zsh_fold_enable = 1
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
let g:fortran_fold=1
let g:clojure_fold = 1
let g:baan_fold=1
autocmd FileType c,cpp setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent

"latex pdf viewer
let g:livepreview_previewer = 'open -a Skim'


""Autopair
let g:AutoPairsShortcutToggle= '<C-P>' 
let g:AutoPairsShortcutFastWrap= '<C-E>'
let g:AutoPairsShortcutJump= '<C-J>'
let g:AutoPairsMapSpace=1

"UndoTree
if has("persistent_undo")
   let target_path = expand('~/.vim/.undo_history')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p")
    endif

    let &undodir=target_path
    set undofile
endif


"GOYO and Limelight
"" Width
"Goyo 120

"" Height
"Goyo x30

"" Both
"Goyo 120x30

"" In percentage
"Goyo 120x50%

"" With offsets
"Goyo 50%+25%x50%-25%
nnoremap <leader>gy :Goyo 120<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Markdown vim
"" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

"
"Color theme
colorscheme gruvbox
let g:gruvbox_transparent_bg='1'
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""]"

"]"
set termguicolors
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="soft"

" <Leader>f{char} to move to {char}
map  <Leader>m <Plug>(easymotion-bd-f)
nmap <Leader>m <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


