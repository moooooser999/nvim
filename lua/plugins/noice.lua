return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
			},
			sections = {
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
			},
			views = {
				cmdline_popup = {
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
					position = {
						row = "20%",
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
			},
			documentation = {
				view = "popup",
				---@type NoiceViewOptions
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
			-- you can enable a preset for easier configuration
			lsp = {
				hover = {
					enabled = false,
				},
				signature = {
					enabled = true,
					view = "hover",
					opts = {
						relative = "cursor",
						border = { style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
						position = {
							row = 3,
							col = 0,
						},
					},
				},
				message = {
					enabled = true,
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
		})
		vim.opt.showmode = false
	end,
}
