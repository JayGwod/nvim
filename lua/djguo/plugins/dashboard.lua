-- import dashboard plugin safely
local status, db = pcall(require, "dashboard")
if not status then
	return
end

-- configure dashboard
db.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = " Update", group = "@property", action = "PackerSync", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Home",
				group = "DiagnosticHint",
				action = "Easypick home",
				key = "h",
			},
			{
				desc = " Dotfiles",
				group = "Number",
				action = "Easypick dotfiles",
				key = "d",
			},
		},
	},
})
