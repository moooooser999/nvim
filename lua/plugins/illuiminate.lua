return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			-- providers: provider d to get references in the buffer, ordered by priority
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
		})
		vim.g.Illuminate_delay = 300
		--force to change highlight color
		---- change the highlight style
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorLine" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorLine" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorLine" })
		-- vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
		-- vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
	end,
}
