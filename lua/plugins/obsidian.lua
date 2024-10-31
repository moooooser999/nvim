return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	-- 	-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	-- 	-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	-- 	-- refer to `:h file-pattern` for more examples
	-- 	"BufReadPre ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/MoooBrain/*.md",
	-- 	"BufNewFile ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/MoooBrain/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "MoooBrain",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/MoooBrain/",
			},
		},
		notes_subdir = "4 - Inbox",
		new_notes_location = "notes_subdir",
		-- Optional, customize how note file names are generated given the ID, target directory, and title.
		---@param spec { id: string, dir: obsidian.Path, title: string|? }
		---@return string|obsidian.Path The full path to the new note.
		note_path_func = function(spec)
			-- This is equivalent to the default behavior.
			local date = os.date("%Y-%m-%d")
			-- local path = spec.dir / date + "_" + tostring(spec.title)
			local file_name = date .. "_" .. spec.title
			local path = spec.dir / file_name
			return path:with_suffix(".md")
		end,
		wiki_link_func = "use_alias_only",
		disable_frontmatter = true,
		templates = {
			subdir = "7 - Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M:%S",
		},
		mappings = {
			-- overrides the 'gf' mapping to work on markdown/wiki links within your vault
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- toggle check-boxes
			-- ["<leader>ch"] = {
			--   action = function()
			--     return require("obsidian").util.toggle_checkbox()
			--   end,
			--   opts = { buffer = true },
			-- },
		},
		completion = {
			nvim_cmp = true,
			min_chars = 0,
		},
		-- ui = {
		-- 	-- Disable some things below here because I set these manually for all Markdown files using treesitter
		-- 	checkboxes = {},
		-- 	bullets = {},
		-- },
	},
}
