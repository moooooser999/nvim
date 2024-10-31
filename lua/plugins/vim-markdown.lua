return {
	"plasticboy/vim-markdown",
	config = function()
		vim.g.mkdp_auto_start = 0
		vim.g.mkdp_auto_close = 1
		vim.g.mkdp_refresh_slow = 0
		vim.g.mkdp_command_for_global = 0
		vim.g.mkdp_open_to_the_world = 0
		vim.g.mkdp_open_ip = ""
		vim.g.mkdp_browser = "min"
		vim.g.mkdp_echo_preview_url = 1
		vim.g.mkdp_browserfunc = ""
		vim.g.mkdp_preview_options = {
			mkit = {},
			katex = {},
			uml = {},
			maid = {},
			disable_sync_scroll = 0,
			sync_scroll_type = "middle",
			hide_yaml_meta = 1,
			sequence_diagrams = {},
			flowchart_diagrams = {},
			content_editable = false,
		}
		vim.g.mkdp_markdown_css = ""
		vim.g.mkdp_highlight_css = ""
		vim.g.mkdp_port = ""
		vim.g.mkdp_page_title = "「${name}」"
		vim.g.mkdp_theme = "dark"
		vim.g.livepreview_previewer = "open -a Skim"
		vim.g.vim_markdown_folding_disabled = 1
		vim.g.vim_markdown_conceal = 0
		vim.g.tex_conceal = ""
		vim.g.vim_markdown_math = 1
		vim.g.vim_markdown_frontmatter = 1
		vim.g.vim_markdown_toml_frontmatter = 1
		vim.g.vim_markdown_json_frontmatter = 1

		vim.cmd([[
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
]])
	end,
}
