return {
	"mbbill/undotree",
	config = function()
		local target_path = vim.fn.expand("~/.vim/.undo_history")
		-- create the directory and any parent directories
		-- if the location does not exist.
		if vim.fn.isdirectory(target_path) == 0 then
			os.execute("mkdir -p " .. target_path)
		end

		vim.opt.undodir = target_path
		vim.opt.undofile = true
	end,
}
