return {
	"mfussenegger/nvim-dap",
	config = function()
		vim.keymap.set(
			"n",
			"<leader>db",
			"<cmd>DapToggleBreakpoint<CR>",
			{ silent = true },
			{ desc = "Toggle breakpoint" }
		)
	end,
}
