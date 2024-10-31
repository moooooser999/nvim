vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 2
vim.o.backspace = "indent,eol,start"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.hidden = true
vim.o.mouse = "a"
vim.o.path = "**"
vim.o.cindent = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.signcolumn = "yes"
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.api.nvim_set_keymap("n", "<Leader>cl", ":set cursorline! cursorcolumn!<CR>", { noremap = true, silent = true })

vim.cmd([[
  au FileType markdown set wrap
  au FileType text set wrap
  command W w
  command Q q
  command Wq wq
  command WQ wq
  let g:netrw_browse_split = 2
  let g:netrw_banner = 0
  let g:netrw_winsize = 25
  set autochdir
  autocmd FileType json syntax match Comment +\/\/.\+$+
]])

vim.cmd([[
  filetype on
  filetype plugin on
  filetype indent on
]])
