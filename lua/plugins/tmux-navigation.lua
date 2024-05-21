return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		local nvim_tmux_nav = require("nvim-tmux-navigation")

		nvim_tmux_nav.setup({
			disable_when_zoomed = false, -- defaults to false
		})

		--let g:tmux_navigator_preserve_zoom = 1
		vim.g.tmux_navigator_disable_when_zoomed = 1
		vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
		vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
		vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
		vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
	end,
}
