return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup()
		vim.opt.list = true
		vim.opt.listchars = { lead = ".", tab = "|." }
	end,
}
