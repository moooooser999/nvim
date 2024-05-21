return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },

						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment region" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment region" },
						["l="] = { query = "@assignment.lhs", desc = "Select lhs part of an assignment region" },
						["r="] = { query = "@assignment.lhs", desc = "Select rhs part of an assignment region" },

						-- conditional
						["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },
						["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional region" },

						["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },
						["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },

						["im"] = { query = "@function.inner", desc = "Select inner part of a function region" },
						["am"] = { query = "@function.outer", desc = "Select outer part of a function region" },

						["ia"] = { query = "@parameter.inner", desc = "Select inner part of a assignment region" },
						["aa"] = { query = "@parameter.outer", desc = "Select outer part of a assignment region" },

						["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },
						["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },

						["is"] = { query = "@statement.inner", desc = "Select inner part of a statement region" },
						["as"] = { query = "@statement.outer", desc = "Select outer part of a statement region" },

						-- You can also use captures from other query groups like `locals.scm`
					},
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true or false
					include_surrounding_whitespace = true,
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
						["]m"] = { query = "@function.outer", desc = "Next function start" },
						["]f"] = { query = "@call.outer", desc = "Next function call start" },
						["]a"] = { query = "@parameter.outer", desc = "Next assignment start" },
						["]b"] = { query = "@block.outer", desc = "Next block start" },
						["]l"] = { query = "@loop.outer", desc = "Next loop start" },
						["]s"] = { query = "@statement.outer", desc = "Next statement start" },
						["]="] = { query = "@assignment.outer", desc = "Next statement start" },
					},
					goto_next_end = {
						["]C"] = { query = "@class.outer", desc = "Next class end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						["]M"] = { query = "@function.outer", desc = "Next function end" },
						["]F"] = { query = "@call.outer", desc = "Next function call start" },
						["]A"] = { query = "@parameter.outer", desc = "Next parameter end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
						["]S"] = { query = "@statement.outer", desc = "Next statement end" },
						["]+"] = { query = "@assignment.outer", desc = "Next assignment start" },
					},
					goto_previous_start = {
						["[c"] = { query = "@class.outer", desc = "Previous class start" },
						["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
						["[m"] = { query = "@function.outer", desc = "Previous function start" },
						["[f"] = { query = "@call.outer", desc = "Previous function call start" },
						["[a"] = { query = "@parameter.outer", desc = "Previous parameter start" },
						["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
						["[s"] = { query = "@statement.outer", desc = "Previous statement start" },
						["[="] = { query = "@assignment.outer", desc = "Next assignment start" },
					},
					goto_previous_end = {
						["[C"] = { query = "@class.outer", desc = "Previous class end" },
						["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
						["[M"] = { query = "@function.outer", desc = "Previous function end" },
						["[F"] = { query = "@call.outer", desc = "Previous function call end" },
						["[+"] = { query = "@assignment.outer", desc = "Previous assignment end" },
						["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
						["[S"] = { query = "@statement.outer", desc = "Previous statement end" },
						["[A"] = { query = "@parameter.outer", desc = "Previous parameter end" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = "@parameter.inner",
						["<leader>nm"] = "@function.outer",
						["<leader>nc"] = "@class.outer",
						["<leader>nl"] = "@loop.outer",
						["<leader>ni"] = "@conditional.outer",
					},
					swap_previous = {
						["<leader>pa"] = "@parameter.inner",
						["<leader>pm"] = "@class.outer",
						["<leader>pc"] = "@function.outer",
						["<leader>pl"] = "@loop.outer",
						["<leader>pi"] = "@conditional.outer",
					},
				},
			},
		})
		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
	end,
}
