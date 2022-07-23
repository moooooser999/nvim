require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
	if term.direction == "horizontal" then
	  return 15
	elseif term.direction == "vertical" then
	  return vim.o.columns * 0.4
	end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals= true,
  shading_factor=2,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
	-- The border key is *almost* the same as 'nvim_open_win'
	-- see :h nvim_open_win for details on borders however
	-- the 'curved' border is a custom border type
	-- not natively supported but implemented in this plugin.
	border = 'double'

  }
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
	border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
	vim.cmd("startinsert!")
	vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
	vim.cmd("Closing terminal")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true, direction="float",float_opts={border="double"} })

function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({ cmd = "ipython3", hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ht", "<cmd>lua _HTOP_TOGGLE()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>py", "<cmd>lua _PYTHON_TOGGLE()<CR>", {noremap = true, silent = true})

