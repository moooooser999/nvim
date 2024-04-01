-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set mapping function
local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- scrolling 9 lines
map("n", "<C-u>", "9k", opt, { desc = "Scroll Up" })
map("n", "<C-d>", "9j", opt, { desc = "Scroll Down" })

-- Copy/Paste
map("n", "<leader>y", '"*y', { desc = "Copy to ClipBoard" })
map("n", "<leader>p", '"*p', { desc = "Paste from ClipBoard" })
map("v", "<leader>y", '"*y', { desc = "Copy to ClipBoard" })
map("v", "<leader>p", '"*p', { desc = "Paste from ClipBoard" })
map("n", "<leader>Y", '"*y', { desc = "Append to ClipBoard" })
map("n", "<leader>P", '"+p', { desc = "Paste from ClipBoard" })

--minimap
map("n", "<leader>mm", ":MinimapToggle<CR>", { desc = "Copy to ClipBoard" })
map("n", "<leader>mr", ":MinimapRefresh<CR>", { desc = "Copy to ClipBoard" })

map("n", "<A-k>", [[:m .-2<cr>==]], opt, { desc = "Move Line Up" })
map("n", "<A-j>", [[:m .+1<cr>==]], opt, { desc = "Move Line Down" })
map("v", "<A-k>", [[:m '<-2<cr>gv=gv]], opt, { desc = "Move Line Up" })
map("v", "<A-j>", [[:m '>+1<cr>gv=gv]], opt, { desc = "Move Line Down" })
map("i", "<A-k>", [[:m .-2<cr>=gi]], opt, { desc = "Move Line Up" })
map("i", "<A-j>", [[:m .+1<cr>=gi]], opt, { desc = "Move Line Down" })
-- Tabs
map("n", "<C-t>", [[:tabnew<cr>]], opt, { desc = "New Tab" })
-- tab key

map("n", "<C-a>", "<TAB>", opt)

map("n", "<tab>", ":s/^/    <CR> :noh<CR>", opt)
map("n", "<S-tab>", ":s/^    /<CR> :noh<CR>", opt)
map("v", "<tab>", ">gv", opt)
map("v", "<S-tab>", "<gv", opt)

-- cancel search highlight

-- wincmd
-- map("n", "<C-l>", ":wincmd l<cr>", { desc = "Move to Right Window" })
-- map("n", "<C-h>", ":wincmd h<cr>", { desc = "Move to Left Window" })
-- map("n", "<C-k>", ":wincmd k<cr>", { desc = "Move to Upper Window" })
-- map("n", "<C-j>", ":wincmd j<cr>", { desc = "Move to Lower Window" })

-- UndotreeToggle
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "UndotreeToggle" })

-- Window resize

map("n", "<leader>pv", ":wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>", { desc = "Resize Window" })
map("n", "<leader>+", ":vertical resize +5<cr>", { desc = "Resize Window [+]" })
map("n", "<leader>-", ":vertical resize -5<cr>", { desc = "Resize Window [-]" })

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
map("n", "<C-w>", ":bdelete!<cr>", { desc = "Close Buffer" })
map("n", "<leader>l", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "<leader>h", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
-- map("n", "<M-l>", ":BufferLineMoveNext<CR>", { desc = "Move Buffer to the Next" })
-- map("n", "<M-h>", ":BufferLineMovePrev<CR>", { desc = "Move Buffer to the Previous" })
map("n", "<C-b>", ":BufferLinePick<CR>", { desc = "Pick Buffer" })
map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to Buffer 1" })
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to Buffer 2" })
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to Buffer 3" })
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to Buffer 4" })
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to Buffer 5" })
map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to Buffer 6" })
map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to Buffer 7" })
map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to Buffer 8" })
map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to Buffer 9" })
map("n", "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", { desc = "Go to Last Buffer" })

--toggle term
--nnoremap <leader>tf :ToggleTerm direction=float<CR>
--nnoremap <leader>tv :ToggleTerm size=80 direction=vertical<CR>
--nnoremap <leader>th :ToggleTerm  size=15 direction=horizontal<CR>
--nnoremap <leader>ot :ToggleTerm
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Toggle Float Terminal" })
map("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Toggle Vertical Terminal" })
map("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "Toggle Horizontal Terminal" })

--telescope
--" Find files using Telescope command-line sugar.
--nnoremap <leader>ff <cmd>Telescope find_files<cr>
--nnoremap <leader>fg <cmd>Telescope live_grep<cr>
--nnoremap <leader>fb <cmd>Telescope buffers<cr>
--nnoremap <leader>fh <cmd>Telescope help_tags<cr>
map("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", ":Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", ":Telescope buffers<cr>", { desc = "Find Buffer" })
map("n", "<leader>fh", ":Telescope help_tags<cr>", { desc = "Find Tags" })

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
-- map("n", "<leader>zf", ":lua require('telekasten').find_notes()<cr>",opt)
-- map("n", "<leader>zd", ":lua require('telekasten').find_daily_notes()<cr>",opt)
-- map("n", "<leader>zg", ":lua require('telekasten').search_notes()<cr>",opt)
-- map("n", "<leader>zz", ":lua require('telekasten').follow_link()<cr>",opt)
-- map("n", "<leader>zT", ":lua require('telekasten').goto_today()<cr>",opt)
-- map("n", "<leader>zW", ":lua require('telekasten').goto_thisweek()<cr>",opt)
-- map("n", "<leader>zw", ":lua require('telekasten').find_weekly_notes()<cr>",opt)
-- map("n", "<leader>zn", ":lua require('telekasten').new_note()<cr>",opt)
-- map("n", "<leader>zN", ":lua require('telekasten').new_templated_note()<cr>",opt)
-- map("n", "<leader>zy", ":lua require('telekasten').yank_notelink()<cr>",opt)
-- map("n", "<leader>zc", ":lua require('telekasten').show_calendar()<cr>",opt)
-- map("n", "<leader>zC", ":CalendarT<cr>",opt)
-- map("n", "<leader>zi", ":lua require('telekasten').paste_img_and_link()<cr>",opt)
-- map("n", "<leader>zt", ":lua require('telekasten').toggle_todo()<cr>",opt)
-- map("n", "<leader>zb", ":lua require('telekasten').show_backlinks()<cr>",opt)
-- map("n", "<leader>zF", ":lua require('telekasten').find_friends()<cr>",opt)
-- map("n", "<leader>zI", ":lua require('telekasten').insert_img_link({i=true})<cr>",opt)
-- map("n", "<leader>zp", ":lua require('telekasten').preview_img()<cr>",opt)
-- map("n", "<leader>zm", ":lua require('telekasten').browse_media()<cr>",opt)
-- map("n", "<leader>za", ":lua require('telekasten').show_tags<cr>",opt)
-- map("n", "<leader>#", ":lua require('telekasten').show_tags()<cr>",opt)
-- map("n", "<leader>zr", ":lua require('telekasten').rename_note()<cr>",opt)
-- --map("n", "<leader>z", ":lua require('telekasten').panel()<cr>",opt)
-- map("n", "<leader>[", ":lua require('telekasten').insert_link()<cr>",opt)

-- NvimTree
--map <C-n> :NvimTreeToggle<CR>

-- { key = {"<2-RightMouse>", "<C-]>", "l","<Right>"},    cb = tree_cb("cd") },
-- { key = {"-","h","<Left>"},                            cb = tree_cb("dir_up") },

-- Zen Mode
map("n", "<leader>zn", ":ZenMode<CR>", { desc = "Zen Mode" })

-- Transparent
map("n", "<leader>op", ":TransparentToggle<CR>", { desc = "Toggle Transparent Mode" })

-- Trouble
vim.keymap.set(
	"n",
	"<leader>xx",
	"<cmd>TroubleToggle<cr>",
	{ silent = true, noremap = true, desc = "Toggle Error Analysis" }
)
vim.keymap.set(
	"n",
	"<leader>xw",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "[LSP] Toggle Error Analysis [Workspace]" }
)
vim.keymap.set(
	"n",
	"<leader>xd",
	"<cmd>TroubleToggle document_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "[LSP] Toggle Error Analysis [Documents]" }
)
vim.keymap.set(
	"n",
	"<leader>xl",
	"<cmd>TroubleToggle loclist<cr>",
	{ silent = true, noremap = true, desc = "[LSP] Toggle Error Analysis [Local Lists]" }
)
vim.keymap.set(
	"n",
	"<leader>xq",
	"<cmd>TroubleToggle quickfix<cr>",
	{ silent = true, noremap = true, desc = "[LSP] Toggle Quick Fix" }
)
vim.keymap.set(
	"n",
	"gr",
	"<cmd>TroubleToggle lsp_references<cr>",
	{ silent = true, noremap = true, desc = "[LSP] Reference" }
)
vim.keymap.set(
	"n",
	"gd",
	"<cmd>Lspsaga goto_definition<cr>",
	{ silent = true, noremap = true, desc = "[LSP]GoTo Definitions" }
)
vim.keymap.set(
	"n",
	"gD",
	"<cmd>Lspsaga peek_definition<cr>",
	{ silent = true, noremap = true, desc = "[LSP]GoTo Definitions" }
)
vim.keymap.set(
	"n",
	"gi",
	"<cmd>TroubleToggle lsp_implementations<cr>",
	{ silent = true, noremap = true, desc = "[LSP] Implementations" }
)
vim.keymap.set(
	"n",
	"<leader>rn",
	"<cmd>lua vim.lsp.buf.rename()<cr>",
	{ silent = true, noremap = true, desc = "[LSP] Rename" }
)
vim.keymap.set(
	"n",
	"<leader>lo",
	"<cmd> Lspsaga outline<cr>",
	{ silent = true, noremap = true, desc = "[LSP] Outline" }
)
vim.keymap.set(
	"n",
	"<leader>ca",
	"<cmd> Lspsaga code_action<cr>",
	{ silent = true, noremap = true, desc = "[LSP] Code Action" }
)
vim.keymap.set(
	"n",
	"K",
	"<cmd> Lspsaga hover_doc<cr>",
	{ silent = true, noremap = true, desc = "[LSP] range code action" }
)
vim.keymap.set("n", "<leader>lf", "<cmd> Lspsaga finder<cr>", { silent = true, noremap = true, desc = "[LSP] Finder" })
-- Copilot Chat

--   {
--   "<leader>ccq",
--   function()
--     local input = vim.fn.input("Quick Chat: ")
--     if input ~= "" then
--       require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
--     end
--   end,
--   desc = "CopilotChat - Quick chat",
-- }
-- Map the above keymap
local quick_chat = function()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end
-- quick chat
vim.keymap.set("n", "<leader>ccq", quick_chat, { silent = true, noremap = true, desc = "CopilotChat - Quick chat" })
-- fix
vim.keymap.set("n", "<leader>ccf", "<cmd>CopilotChatFix<cr>", { silent = true, noremap = true, desc = "Copilot - Fix" })
-- explain
vim.keymap.set(
	"n",
	"<leader>ccx",
	"<cmd>CopilotChatExplain<cr>",
	{ silent = true, noremap = true, desc = "Copilot - Explain" }
)
-- commit
vim.keymap.set(
	"n",
	"<leader>ccc",
	"<cmd>CopilotChatCommit<cr>",
	{ silent = true, noremap = true, desc = "Copilot - Commit" }
)
-- write doc
vim.keymap.set(
	"n",
	"<leader>ccw",
	"<cmd>CopilotChatDocs<cr>",
	{ silent = true, noremap = true, desc = "Copilot - Write Docs" }
)
vim.keymap.set(
	"n",
	"<leader>cct",
	"<cmd>CopilotChatTests<cr>",
	{ silent = true, noremap = true, desc = "Copilot - Test" }
)
