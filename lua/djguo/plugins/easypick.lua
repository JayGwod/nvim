local setup, easypick = pcall(require, "easypick")
if not setup then
	return
end

easypick.setup({
	pickers = {
		-- add your custom pickers here

		-- list all files inside current folder with default previewer
		-- https://github.com/nvim-telescope/telescope.nvim/issues/2105#issuecomment-1251136216
		{
			-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
			name = "dotfiles",
			-- the command to execute, output has to be a list of plain text entries
			command = "fdfind --hidden --glob '' .",
			-- specify your custom previwer, or use one of the easypick.previewers
			previewer = easypick.previewers.default(),
		},
		-- list all files inside home folder with default previewer
		{
			name = "home",
			command = "fdfind --hidden --glob '' ~",
			previewer = easypick.previewers.default(),
		},
	},
})
