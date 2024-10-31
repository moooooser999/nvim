return {
	"lyokha/vim-xkbswitch",
	config = function()
		vim.g.XkbSwitchEnabled = 1
		vim.g.XkbSwitchLib = "/usr/local/lib/libxkbswitch.dylib"
	end,
}
