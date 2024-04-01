return {
	"gruvbox-community/gruvbox",
	config = function()
		vim.cmd([[
  hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
  hi tkBrackets ctermfg=gray guifg=gray
  hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold
  hi link CalNavi CalRuler
  hi tkTagSep ctermfg=gray guifg=gray
  hi tkTag ctermfg=175 guifg=#d3869B
]])
		vim.opt.termguicolors = true
		vim.g.gruvbox_contrast_dark = "soft"
		vim.cmd("colorscheme gruvbox")
	end,
}
