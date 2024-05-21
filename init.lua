-- load basic settings
require("basic")
-- load key mappings
require("keybindings")
-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", { ui = { border = "rounded" } })
vim.g.maplocalleader = " "

-- set bg to transparent
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
