return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true }, { desc = "Test nearest" })
		vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { silent = true }, { desc = "Test file" })
		vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { silent = true }, { desc = "Test suite" })
		vim.keymap.set("n", "<leader>lt", ":TestLast<CR>", { silent = true }, { desc = "Test last" })
		vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { silent = true }, { desc = "Test visit" })
		vim.cmd("let test#strategy = 'vimux'")
		vim.cmd("let test#python#runner = 'pytest'")
		vim.cmd("let test#python#pytest#file_pattern = '.py'")
	end,
}
