return {
	"zbirenbaum/copilot-cmp",
	dependencies = { "copilot.lua" },
	config = function()
		require("copilot_cmp").setup({
			suggestion = {
				enable = false,
			},
			panel = {
				enable = false,
			},
		})
	end,
}
