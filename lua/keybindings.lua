-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set mapping function
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- scrolling 9 lines
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- do not use arrow keys
map("n","<Left>",[[:echoe "Use h"<cr>]],opt)
map("n","<Right>",[[:echoe "Use l<cr>"]],opt)
map("n","<Up>",[[:echoe "Use k<cr>"]],opt)
map("n","<Down>",[[:echoe "Use j<cr>"]],opt)

map("n","<A-k>",[[:m .-2<cr>==]],opt)
map("n","<A-j>",[[:m .+1<cr>==]],opt)
map("v","<A-k>",[[:m '<-2<cr>gv=gv]],opt)
map("v","<A-j>",[[:m '>+1<cr>gv=gv]],opt)
map("i","<A-k>",[[:m .-2<cr>=gi]],opt)
map("i","<A-j>",[[:m .+1<cr>=gi]],opt)
-- Tabs
map("n","<C-t>",[[:tabnew<cr>]],opt)
-- tab key
map("n", "C-l", "<TAB>",opt)
map("n","<tab>",":s/^/\t<CR> :noh<CR>",opt)
map("n","<S-tab>",":s/^\t/<CR> :noh<CR>",opt)

-- cancel search highlight
map("n","\\",":noh<cr>",opt)


-- wincmd
map("n","<leader>l",":wincmd l<cr>", opt)
map("n","<leader>h",":wincmd h<cr>", opt)
map("n","<leader>k",":wincmd k<cr>", opt)
map("n","<leader>j",":wincmd j<cr>", opt)

-- UndotreeToggle
map("n", "<leader>u", ":UndotreeToggle<CR>",opt)


-- Window resize

map("n", "<leader>pv", ":wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>", opt)
map("n", "<leader>+", ":vertical resize +5<cr>", opt)
map("n", "<leader>-", ":vertical resize -5<cr>", opt)



-- Bufferline Shortcut
--nnoremap <silent><C-l> :BufferLineCycleNext<CR>
--nnoremap <silent><C-h> :BufferLineCyclePrev<CR>
--nnoremap <silent><C-b> :BufferLinePick<CR>
--nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
--nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
--nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
--nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
--nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
--nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
--nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
--nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
--nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
--nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>
--nnoremap <C-w> :bdelete! %d<cr>
map("n", "<C-w>", ":bdelete!<cr>",opt)
map("n","<C-l>",":BufferLineCycleNext<CR>",opt)
map("n","<C-h>",":BufferLineCyclePrev<CR>",opt)
map("n", "<A-l>",":BufferLineMoveNext<CR>",opt)
map("n", "<A-h>",":BufferLineMovePrev<CR>",opt)
map("n","<C-b>",":BufferLinePick<CR>",opt)
map("n","<leader>1","<Cmd>BufferLineGoToBuffer 1<CR>",opt)
map("n","<leader>2","<Cmd>BufferLineGoToBuffer 2<CR>",opt)
map("n","<leader>3","<Cmd>BufferLineGoToBuffer 3<CR>",opt)
map("n","<leader>4","<Cmd>BufferLineGoToBuffer 4<CR>",opt)
map("n","<leader>5","<Cmd>BufferLineGoToBuffer 5<CR>",opt)
map("n","<leader>6","<Cmd>BufferLineGoToBuffer 6<CR>",opt)
map("n","<leader>7","<Cmd>BufferLineGoToBuffer 7<CR>",opt)
map("n","<leader>8","<Cmd>BufferLineGoToBuffer 8<CR>",opt)
map("n","<leader>9","<Cmd>BufferLineGoToBuffer 9<CR>",opt)
map("n","<leader>$","<Cmd>BufferLineGoToBuffer -1<CR>",opt)

--toggle term
--nnoremap <leader>tf :ToggleTerm direction=float<CR>
--nnoremap <leader>tv :ToggleTerm size=80 direction=vertical<CR>
--nnoremap <leader>th :ToggleTerm  size=15 direction=horizontal<CR>
--nnoremap <leader>ot :ToggleTerm 
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>",opt)
map("n", "<leader>tv", ":ToggleTerm size=80 direction=vertical<CR>",opt)
map("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>",opt)
map("n", "<leader>ot", ":ToggleTerm direction=float<CR>",opt)

--telescope
--" Find files using Telescope command-line sugar.
--nnoremap <leader>ff <cmd>Telescope find_files<cr>
--nnoremap <leader>fg <cmd>Telescope live_grep<cr>
--nnoremap <leader>fb <cmd>Telescope buffers<cr>
--nnoremap <leader>fh <cmd>Telescope help_tags<cr>
map("n", "<leader>ff", ":Telescope find_files<cr>",opt)
map("n", "<leader>fg", ":Telescope live_grep<cr>",opt)
map("n", "<leader>fb", ":Telescope buffers<cr>",opt)
map("n", "<leader>fh", ":Telescope help_tags<cr>",opt)


-- Telekasten
--nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
--nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
--nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
--nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
--nnoremap <leader>zT :lua require('telekasten').goto_today()<CR>
--nnoremap <leader>zW :lua require('telekasten').goto_thisweek()<CR>
--nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
--nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
--nnoremap <leader>zN :lua require('telekasten').new_templated_note()<CR>
--nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
--nnoremap <leader>zc :lua require('telekasten').show_calendar()<CR>
--nnoremap <leader>zC :CalendarT<CR>
--nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
--nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
--nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
--nnoremap <leader>zF :lua require('telekasten').find_friends()<CR>
--nnoremap <leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
--nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
--nnoremap <leader>zm :lua require('telekasten').browse_media()<CR>
--nnoremap <leader>za :lua require('telekasten').show_tags()<CR>
--nnoremap <leader># :lua require('telekasten').show_tags()<CR>
--nnoremap <leader>zr :lua require('telekasten').rename_note()<CR>

--" on hesitation, bring up the panel
--nnoremap <leader>z :lua require('telekasten').panel()<cr>

--" we could define [[ in **insert mode** to call insert link
--nnoremap <leader>[ <cmd>:lua require('telekasten').insert_link()<cr>
--" alternatively: leader [
map("n", "<leader>zf", ":lua require('telekasten').find_notes()<cr>",opt)
map("n", "<leader>zd", ":lua require('telekasten').find_daily_notes()<cr>",opt)
map("n", "<leader>zg", ":lua require('telekasten').search_notes()<cr>",opt)
map("n", "<leader>zz", ":lua require('telekasten').follow_link()<cr>",opt)
map("n", "<leader>zT", ":lua require('telekasten').goto_today()<cr>",opt)
map("n", "<leader>zW", ":lua require('telekasten').goto_thisweek()<cr>",opt)
map("n", "<leader>zw", ":lua require('telekasten').find_weekly_notes()<cr>",opt)
map("n", "<leader>zn", ":lua require('telekasten').new_note()<cr>",opt)
map("n", "<leader>zN", ":lua require('telekasten').new_templated_note()<cr>",opt)
map("n", "<leader>zy", ":lua require('telekasten').yank_notelink()<cr>",opt)
map("n", "<leader>zc", ":lua require('telekasten').show_calendar()<cr>",opt)
map("n", "<leader>zC", ":CalendarT<cr>",opt)
map("n", "<leader>zi", ":lua require('telekasten').paste_img_and_link()<cr>",opt)
map("n", "<leader>zt", ":lua require('telekasten').toggle_todo()<cr>",opt)
map("n", "<leader>zb", ":lua require('telekasten').show_backlinks()<cr>",opt)
map("n", "<leader>zF", ":lua require('telekasten').find_friends()<cr>",opt)
map("n", "<leader>zI", ":lua require('telekasten').insert_img_link({i=true})<cr>",opt)
map("n", "<leader>zp", ":lua require('telekasten').preview_img()<cr>",opt)
map("n", "<leader>zm", ":lua require('telekasten').browse_media()<cr>",opt)
map("n", "<leader>za", ":lua require('telekasten').show_tags<cr>",opt)
map("n", "<leader>#", ":lua require('telekasten').show_tags()<cr>",opt)
map("n", "<leader>zr", ":lua require('telekasten').rename_note()<cr>",opt)
map("n", "<leader>z", ":lua require('telekasten').panel()<cr>",opt)
map("n", "<leader>[", ":lua require('telekasten').insert_link()<cr>",opt)


-- NvimTree
--map <C-n> :NvimTreeToggle<CR>
map("n","<C-n>",":NvimTreeToggle<CR>", opt)
map("i","<C-n>",":NvimTreeToggle<CR>", opt)
map("v","<C-n>",":NvimTreeToggle<CR>", opt)

