return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			sversiones = "fade_in_slide_out",
			-- background_colour = "FloatShadow",
			timeout = 3000,
			background_colour = "#000000",
		})
		vim.notify = require("notify")
	end,
}
