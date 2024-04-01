return {
	"geg2102/nvim-python-repl",
	dependencies = "nvim-treesitter",
	ft = { "python", "lua", "scala" },
	config = function()
		require("nvim-python-repl").setup({
			execute_on_send = true,
		})
		vim.keymap.set("n", "<leader>ru", function()
			require("nvim-python-repl").send_statement_definition()
		end, { desc = "Send semantic unit to REPL" })

		vim.keymap.set("v", "<leader>rv", function()
			require("nvim-python-repl").send_visual_to_repl()
		end, { desc = "Send visual selection to REPL" })

		vim.keymap.set("n", "<leader>rb", function()
			require("nvim-python-repl").send_buffer_to_repl()
		end, { desc = "Send entire buffer to REPL" })

		vim.keymap.set("n", "<leade>rxx", function()
			require("nvim-python-repl").toggle_execute()
		end, { desc = "Automatically execute command in REPL after sent" })

		vim.keymap.set("n", "<leader>rh", function()
			require("nvim-python-repl").toggle_vertical()
		end, { desc = "Create REPL in vertical or horizontal split" })
	end,
}
