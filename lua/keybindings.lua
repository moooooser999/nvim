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
map("n","<Left>",[[:echoe "Use h"]],opt)
map("n","<Right>",[[:echoe "Use l"]],opt)
map("n","<Up>",[[:echoe "Use k"]],opt)
map("n","<Down>",[[:echoe "Use j"]],opt)

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


--nnoremap <silent> <leader>aj <Cmd>Lspsaga diagnostic_jump_next<CR> "nnoremap <silent> <leader>j <Cmd>Lspsaga diagnostic_jump_next<CR>
--"nnoremap <silent> <Cmd>Lspsaga diagnostic_jump_next<CR>
--nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
--nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
--" scroll up hover doc
--nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
--"inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
--nnoremap <silent> <c-k> <Cmd>Lspsaga signature_help<CR>
--nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

--" code action
--" 智能处理，使用IDEA Alt+Enter 同样按键
--nnoremap <silent><C-Enter> <cmd>lua require('lspsaga.codeaction').code_action()<CR>
--nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
--vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

--" 重命名 感觉没有lsp自带的功能好用，因为名称要从头输入
--nnoremap <silent><leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>
--"预览定义
--nnoremap <silent> <leader>gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
--"Jump Diagnostic and Show Diagnostics
--nnoremap <silent> <leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>


local pluginKeys = {}

pluginKeys.mapLSP = function(mapbuf)
  -- rename
  --[[
  --Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
 ]]
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- code action
  --[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  --]]
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  -- go xx
  --[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  --]]
  mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
  --[[
  Lspsaga 替换 gh
  mapbuf("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --]]
  mapbuf("n", "K", "<cmd>Lspsaga hover_doc<cr>", opt)
  --[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
  mapbuf("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opt)
  --[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
  -- diagnostic
  mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- lsp 回调函数快捷键设置


pluginKeys.cmp = function(cmp)
  local luasnip = require('luasnip')
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    -- 上一个
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<C-<space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
	 ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	

    -- super Tab
        ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
        ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
    -- end of super Tab
  }
end

return pluginKeys


